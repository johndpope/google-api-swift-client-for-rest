//
//  SGGeneration+Argo.swift
//  ServiceGenerator
//
//  Created by Douglas Beal on 7/9/16.
//
//

import Foundation



public let header = [
           "// generated by ServiceGenerator",
           "import Argo"/*,
           "import Curry"*/]


public extension SGGenerator {

    public func objectsCodingArgoSource() -> String {
        var parts: Array<String> = header
        var classParts: Array<String> = []
        var curry = Set<UInt32>()
        for schema in self.api.sg_topLevelObjectSchemas  {
            guard let schema = schema as? GTLRDiscovery_JsonSchema else { fatalError() }
            let (objectClassStr,curryArgSet) = self.generateObjectArgoExtension(schema,
                                                                   forMode:kGenerateImplementation)
            classParts.append(objectClassStr)
            curry = curry.union(curryArgSet)
            for subSchema in schema.sg_childObjectSchemas  {
                guard let subSchema = subSchema as? GTLRDiscovery_JsonSchema else { fatalError() }
                let (subObjectClassStr,currySubArgSet) = self.generateObjectArgoExtension(subSchema,
                                                                   forMode:kGenerateImplementation)
                classParts.append(subObjectClassStr)
                curry = curry.union(currySubArgSet)
            }

        }
        var customCurry: Array<String> = []
        let maxExistingCurryArity = UInt32(1) //UInt32(UnicodeScalar("V").value) - UInt32(UnicodeScalar("A").value)
        let offset = UInt32(UnicodeScalar("A").value)
        let rangeOffset = UInt32(UnicodeScalar("Z").value) - offset 
        let digitCount = rangeOffset + 1
        for arity in curry.sorted() {
            guard arity > maxExistingCurryArity else { continue }
            let types: Array<String> = CountableRange<UInt32>(0..<arity).map {
                (position) in
                var string = ""
                let digits = arity/digitCount
                if digits > 1 {
                    if position > (digitCount - 1) {
                        for digit in (2...digits).reversed() {
                            let div = UInt32(digitCount*digit)
                            let ch = position/div
                            string += String(Character(UnicodeScalar(offset + ch)!))
                        }
                    } else {
                        string += " "
                    }
                } 
                string += String(Character(UnicodeScalar(offset + (position%digitCount))!))
                return string
            }
            let count = types.count
            let genericTypeList = types.joined(separator: ",")
            let functionArgumentList = types[0..<count-1].joined(separator: ",")
            let functionReturnType = types[count-1]
            let returnChain = types.joined(separator: " -> ")
            let labels = types.map { return "`\($0.lowercased())`" }
            var bodyArray: Array<String> = labels[0..<count-1].enumerated().map { (index, label) in  
                let `type` = types[index]
                let function = "(\(label): \(`type`)) ->"
                let typeChain = types[index+1..<types.count].joined(separator: " -> ")
                return "\(function) \(typeChain) in {"
            }
            let functionCall = labels[0..<count-1].joined(separator: ",")
            bodyArray.append("function(\(functionCall))")
            bodyArray.append(String(repeating: "}", count: count-2))
            let body = bodyArray.joined(separator: "")
            let curryFunc = "func curry<\(genericTypeList)>" +
                            "(function: (\(functionArgumentList)) -> \(functionReturnType))" +
                            " -> \(returnChain) {\n" +
                            indent(1) + "return {\(body)}\n" +
                            "}\n"
            customCurry.append(curryFunc)
            
        }
        parts.append(customCurry.joined(separator: "\n"))
        // Two blank lines between classes.
        parts.append(classParts.joined(separator: "\n\n"))
        return parts.joined(separator: "\n")
    }

    public func generateObjectArgoExtension(_ schema: GTLRDiscovery_JsonSchema,
                                             forMode mode: GeneratorMode )
    -> (body: String, curry: Set<UInt32>) {
        let schemaClassName = schema.sg_objcClassName
        let locator = "\(#file):\(#function):\(#line):\(#column)"        
        let decl = "extension \(schemaClassName): Decodable { // \(locator)"
        let declOpen = indent(0) + decl
        let declClose = indent(0) + "} //" + decl
        
        var body = Array<String>()
        var curryArgSet = Set<UInt32>()


        body.append(declOpen)
        let decodeOpen = indent(1) + "static func decode (json: Argo.JSON) -> Decoded<\(schemaClassName)> {"
        let chunkSize = 2
        var chunkIndex = 0
        body.append(decodeOpen)        
        if let properties = schema.properties?.additionalProperties() {
            let curry = indent(2) + "let part\(chunkIndex) = Curry.curry(\(schemaClassName).init)"
            chunkIndex += 1
            body.append(curry)
            var count = UInt32(0)
            for tuple in (properties.sorted { $0.0 < $1.0 } ).enumerated() {
                guard let schema = tuple.element.value as? GTLRDiscovery_JsonSchema else { fatalError() }
                let name = tuple.element.key
                let index = tuple.offset                      
                let op = (index == 0) ? "<^>": "<*>"
                let property = SchemaSwiftWrapper(schema: schema.sg_resolved)
                if index > 0 && index % chunkSize == 0 {
                    body.append(indent(2) +
                                  "let part\(chunkIndex) = part\(chunkIndex-1)")
                    chunkIndex += 1
                }
                let isArray = property.type == "array"
                let isOptional = true
                var deop = isArray ? "<||" : "<|"
                if isOptional {
                    deop += "?"
                }
                guard index >= 0 else { fatalError() }
                count = UInt32(index)
                body.append(indent(3) + "\(op) json \(deop) \"\(name)\"")
            }
            curryArgSet.insert(count)
            body.append(indent(2) +
                          "return part\(chunkIndex-1)")
        }

        let decodeClose = indent(1) + "} // decode"
        body.append(decodeClose)

        body.append(declClose)
        return (body: body.joined(separator: "\n"), curry: curryArgSet)
    }
}
