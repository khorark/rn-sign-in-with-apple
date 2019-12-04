#import <Foundation/Foundation.h>

#import "React/RCTBridgeModule.h"
#import "RCTSwiftBridgeModule.h"

@interface RCT_EXTERN_SWIFT_MODULE(RnSignInWithApple)

RCT_EXTERN_METHOD(
   login: (RCTPromiseResolveBlock)resolve
   rejecter: (RCTPromiseRejectBlock)reject
)

@end
