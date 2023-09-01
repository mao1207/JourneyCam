//
//  NativeCallProxy.h
//  JourneyCam
//
//  Created by 徐满心 on 2023/8/31.
//

#import <Foundation/Foundation.h>

@protocol NativeCallsProtocol
@required
- (void) sendMessageToMobileApp:(NSString*)message;
// other methods
@end

__attribute__ ((visibility("default")))
@interface FrameworkLibAPI : NSObject
+(void) registerAPIforNativeCalls:(id<NativeCallsProtocol>) aApi;

@end
