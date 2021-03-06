// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Google Cloud Container Builder API (cloudbuild/v1)
// Description:
//   Builds container images in the cloud.
// Documentation:
//   https://cloud.google.com/container-builder/docs/

#import "GTLRCloudBuildObjects.h"

// ----------------------------------------------------------------------------
// Constants

// GTLRCloudBuild_Build.status
NSString * const kGTLRCloudBuild_Build_Status_Cancelled     = @"CANCELLED";
NSString * const kGTLRCloudBuild_Build_Status_Failure       = @"FAILURE";
NSString * const kGTLRCloudBuild_Build_Status_InternalError = @"INTERNAL_ERROR";
NSString * const kGTLRCloudBuild_Build_Status_Queued        = @"QUEUED";
NSString * const kGTLRCloudBuild_Build_Status_Queuing       = @"QUEUING";
NSString * const kGTLRCloudBuild_Build_Status_StatusUnknown = @"STATUS_UNKNOWN";
NSString * const kGTLRCloudBuild_Build_Status_Success       = @"SUCCESS";
NSString * const kGTLRCloudBuild_Build_Status_Timeout       = @"TIMEOUT";
NSString * const kGTLRCloudBuild_Build_Status_Working       = @"WORKING";

// GTLRCloudBuild_BuildOptions.requestedVerifyOption
NSString * const kGTLRCloudBuild_BuildOptions_RequestedVerifyOption_NotVerified = @"NOT_VERIFIED";
NSString * const kGTLRCloudBuild_BuildOptions_RequestedVerifyOption_Verified = @"VERIFIED";

// GTLRCloudBuild_BuildOptions.sourceProvenanceHash
NSString * const kGTLRCloudBuild_BuildOptions_SourceProvenanceHash_None = @"NONE";
NSString * const kGTLRCloudBuild_BuildOptions_SourceProvenanceHash_Sha256 = @"SHA256";

// GTLRCloudBuild_Hash.type
NSString * const kGTLRCloudBuild_Hash_Type_None   = @"NONE";
NSString * const kGTLRCloudBuild_Hash_Type_Sha256 = @"SHA256";

// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_Build
//

@implementation GTLRCloudBuild_Build
@dynamic createTime, finishTime, identifier, images, logsBucket, logUrl,
         options, projectId, results, source, sourceProvenance, startTime,
         status, statusDetail, steps, timeout;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"identifier" : @"id" };
}

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"images" : [NSString class],
    @"steps" : [GTLRCloudBuild_BuildStep class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_BuildOperationMetadata
//

@implementation GTLRCloudBuild_BuildOperationMetadata
@dynamic build;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_BuildOptions
//

@implementation GTLRCloudBuild_BuildOptions
@dynamic requestedVerifyOption, sourceProvenanceHash;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"sourceProvenanceHash" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_BuildStep
//

@implementation GTLRCloudBuild_BuildStep
@dynamic args, dir, env, identifier, name, waitFor;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"identifier" : @"id" };
}

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"args" : [NSString class],
    @"env" : [NSString class],
    @"waitFor" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_BuildTrigger
//

@implementation GTLRCloudBuild_BuildTrigger
@dynamic build, createTime, descriptionProperty, disabled, filename, identifier,
         triggerTemplate;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  NSDictionary<NSString *, NSString *> *map = @{
    @"descriptionProperty" : @"description",
    @"identifier" : @"id"
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_BuiltImage
//

@implementation GTLRCloudBuild_BuiltImage
@dynamic digest, name;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_CancelBuildRequest
//

@implementation GTLRCloudBuild_CancelBuildRequest
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_Empty
//

@implementation GTLRCloudBuild_Empty
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_FileHashes
//

@implementation GTLRCloudBuild_FileHashes
@dynamic fileHash;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"fileHash" : [GTLRCloudBuild_Hash class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_Hash
//

@implementation GTLRCloudBuild_Hash
@dynamic type, value;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_ListBuildsResponse
//

@implementation GTLRCloudBuild_ListBuildsResponse
@dynamic builds, nextPageToken;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"builds" : [GTLRCloudBuild_Build class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"builds";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_ListBuildTriggersResponse
//

@implementation GTLRCloudBuild_ListBuildTriggersResponse
@dynamic triggers;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"triggers" : [GTLRCloudBuild_BuildTrigger class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_ListOperationsResponse
//

@implementation GTLRCloudBuild_ListOperationsResponse
@dynamic nextPageToken, operations;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"operations" : [GTLRCloudBuild_Operation class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"operations";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_Operation
//

@implementation GTLRCloudBuild_Operation
@dynamic done, error, metadata, name, response;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_OperationMetadata
//

@implementation GTLRCloudBuild_OperationMetadata

+ (Class)classForAdditionalProperties {
  return [NSObject class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_OperationResponse
//

@implementation GTLRCloudBuild_OperationResponse

+ (Class)classForAdditionalProperties {
  return [NSObject class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_RepoSource
//

@implementation GTLRCloudBuild_RepoSource
@dynamic branchName, commitSha, projectId, repoName, tagName;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_Results
//

@implementation GTLRCloudBuild_Results
@dynamic buildStepImages, images;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"buildStepImages" : [NSString class],
    @"images" : [GTLRCloudBuild_BuiltImage class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_Source
//

@implementation GTLRCloudBuild_Source
@dynamic repoSource, storageSource;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_SourceProvenance
//

@implementation GTLRCloudBuild_SourceProvenance
@dynamic fileHashes, resolvedRepoSource, resolvedStorageSource;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_SourceProvenanceFileHashes
//

@implementation GTLRCloudBuild_SourceProvenanceFileHashes

+ (Class)classForAdditionalProperties {
  return [GTLRCloudBuild_FileHashes class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_Status
//

@implementation GTLRCloudBuild_Status
@dynamic code, details, message;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"details" : [GTLRCloudBuild_StatusDetailsItem class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_StatusDetailsItem
//

@implementation GTLRCloudBuild_StatusDetailsItem

+ (Class)classForAdditionalProperties {
  return [NSObject class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudBuild_StorageSource
//

@implementation GTLRCloudBuild_StorageSource
@dynamic bucket, generation, object;
@end
