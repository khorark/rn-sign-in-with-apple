#import "RnSignInWithApple.h"
#import "React/RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(RnSignInWithApple, NSObject)

RCT_EXTERN_METHOD(
   login: (RCTPromiseResolveBlock)resolve
   rejecter: (RCTPromiseRejectBlock)reject
)

@end
