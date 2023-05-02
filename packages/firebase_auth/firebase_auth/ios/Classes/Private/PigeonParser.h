#import <Foundation/Foundation.h>
#import "messages.g.h"
#import <Firebase/Firebase.h>

@interface PigeonParser : NSObject

+ (PigeonUserCredential *_Nullable)getPigeonUserCredentialFromAuthResult:(nonnull FIRAuthDataResult *)authResult;
+ (PigeonUserDetails *_Nullable)getPigeonDetails:(nonnull FIRUser *)user;
+ (PigeonUserInfo *_Nullable)getPigeonUserInfo:(nonnull FIRUser *)user;

@end