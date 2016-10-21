// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Fitness (fitness/v1)
// Description:
//   Stores and accesses user data in the fitness store from apps on any
//   platform.
// Documentation:
//   https://developers.google.com/fit/rest/

#import "GTLRFitness.h"

// ----------------------------------------------------------------------------
// Authorization scopes

NSString * const kGTLRAuthScopeFitnessActivityRead   = @"https://www.googleapis.com/auth/fitness.activity.read";
NSString * const kGTLRAuthScopeFitnessActivityWrite  = @"https://www.googleapis.com/auth/fitness.activity.write";
NSString * const kGTLRAuthScopeFitnessBodyRead       = @"https://www.googleapis.com/auth/fitness.body.read";
NSString * const kGTLRAuthScopeFitnessBodyWrite      = @"https://www.googleapis.com/auth/fitness.body.write";
NSString * const kGTLRAuthScopeFitnessLocationRead   = @"https://www.googleapis.com/auth/fitness.location.read";
NSString * const kGTLRAuthScopeFitnessLocationWrite  = @"https://www.googleapis.com/auth/fitness.location.write";
NSString * const kGTLRAuthScopeFitnessNutritionRead  = @"https://www.googleapis.com/auth/fitness.nutrition.read";
NSString * const kGTLRAuthScopeFitnessNutritionWrite = @"https://www.googleapis.com/auth/fitness.nutrition.write";

// ----------------------------------------------------------------------------
//   GTLRFitnessService
//

@implementation GTLRFitnessService

- (instancetype)init {
  self = [super init];
  if (self) {
    // From discovery.
    self.rootURLString = @"https://www.googleapis.com/";
    self.servicePath = @"fitness/v1/users/";
    self.batchPath = @"batch";
    self.prettyPrintQueryParameterNames = @[ @"prettyPrint" ];
  }
  return self;
}

@end
