// Autogenerated from Pigeon (v9.2.4), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "messages.g.h"
#if TARGET_OS_OSX
#import <FlutterMacOS/FlutterMacOS.h>
#else
#import <Flutter/Flutter.h>
#endif

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSArray *wrapResult(id result, FlutterError *error) {
  if (error) {
    return @[
      error.code ?: [NSNull null], error.message ?: [NSNull null], error.details ?: [NSNull null]
    ];
  }
  return @[ result ?: [NSNull null] ];
}
static id GetNullableObjectAtIndex(NSArray *array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}

@interface PigeonMultiFactorSession ()
+ (PigeonMultiFactorSession *)fromList:(NSArray *)list;
+ (nullable PigeonMultiFactorSession *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface PigeonPhoneMultiFactorAssertion ()
+ (PigeonPhoneMultiFactorAssertion *)fromList:(NSArray *)list;
+ (nullable PigeonPhoneMultiFactorAssertion *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface PigeonMultiFactorInfo ()
+ (PigeonMultiFactorInfo *)fromList:(NSArray *)list;
+ (nullable PigeonMultiFactorInfo *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface PigeonFirebaseApp ()
+ (PigeonFirebaseApp *)fromList:(NSArray *)list;
+ (nullable PigeonFirebaseApp *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@implementation PigeonMultiFactorSession
+ (instancetype)makeWithId:(NSString *)id {
  PigeonMultiFactorSession *pigeonResult = [[PigeonMultiFactorSession alloc] init];
  pigeonResult.id = id;
  return pigeonResult;
}
+ (PigeonMultiFactorSession *)fromList:(NSArray *)list {
  PigeonMultiFactorSession *pigeonResult = [[PigeonMultiFactorSession alloc] init];
  pigeonResult.id = GetNullableObjectAtIndex(list, 0);
  NSAssert(pigeonResult.id != nil, @"");
  return pigeonResult;
}
+ (nullable PigeonMultiFactorSession *)nullableFromList:(NSArray *)list {
  return (list) ? [PigeonMultiFactorSession fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    (self.id ?: [NSNull null]),
  ];
}
@end

@implementation PigeonPhoneMultiFactorAssertion
+ (instancetype)makeWithVerificationId:(NSString *)verificationId
                      verificationCode:(NSString *)verificationCode {
  PigeonPhoneMultiFactorAssertion *pigeonResult = [[PigeonPhoneMultiFactorAssertion alloc] init];
  pigeonResult.verificationId = verificationId;
  pigeonResult.verificationCode = verificationCode;
  return pigeonResult;
}
+ (PigeonPhoneMultiFactorAssertion *)fromList:(NSArray *)list {
  PigeonPhoneMultiFactorAssertion *pigeonResult = [[PigeonPhoneMultiFactorAssertion alloc] init];
  pigeonResult.verificationId = GetNullableObjectAtIndex(list, 0);
  NSAssert(pigeonResult.verificationId != nil, @"");
  pigeonResult.verificationCode = GetNullableObjectAtIndex(list, 1);
  NSAssert(pigeonResult.verificationCode != nil, @"");
  return pigeonResult;
}
+ (nullable PigeonPhoneMultiFactorAssertion *)nullableFromList:(NSArray *)list {
  return (list) ? [PigeonPhoneMultiFactorAssertion fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    (self.verificationId ?: [NSNull null]),
    (self.verificationCode ?: [NSNull null]),
  ];
}
@end

@implementation PigeonMultiFactorInfo
+ (instancetype)makeWithDisplayName:(nullable NSString *)displayName
                enrollmentTimestamp:(NSNumber *)enrollmentTimestamp
                           factorId:(nullable NSString *)factorId
                                uid:(NSString *)uid
                        phoneNumber:(nullable NSString *)phoneNumber {
  PigeonMultiFactorInfo *pigeonResult = [[PigeonMultiFactorInfo alloc] init];
  pigeonResult.displayName = displayName;
  pigeonResult.enrollmentTimestamp = enrollmentTimestamp;
  pigeonResult.factorId = factorId;
  pigeonResult.uid = uid;
  pigeonResult.phoneNumber = phoneNumber;
  return pigeonResult;
}
+ (PigeonMultiFactorInfo *)fromList:(NSArray *)list {
  PigeonMultiFactorInfo *pigeonResult = [[PigeonMultiFactorInfo alloc] init];
  pigeonResult.displayName = GetNullableObjectAtIndex(list, 0);
  pigeonResult.enrollmentTimestamp = GetNullableObjectAtIndex(list, 1);
  NSAssert(pigeonResult.enrollmentTimestamp != nil, @"");
  pigeonResult.factorId = GetNullableObjectAtIndex(list, 2);
  pigeonResult.uid = GetNullableObjectAtIndex(list, 3);
  NSAssert(pigeonResult.uid != nil, @"");
  pigeonResult.phoneNumber = GetNullableObjectAtIndex(list, 4);
  return pigeonResult;
}
+ (nullable PigeonMultiFactorInfo *)nullableFromList:(NSArray *)list {
  return (list) ? [PigeonMultiFactorInfo fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    (self.displayName ?: [NSNull null]),
    (self.enrollmentTimestamp ?: [NSNull null]),
    (self.factorId ?: [NSNull null]),
    (self.uid ?: [NSNull null]),
    (self.phoneNumber ?: [NSNull null]),
  ];
}
@end

@implementation PigeonFirebaseApp
+ (instancetype)makeWithAppName:(NSString *)appName tenantId:(nullable NSString *)tenantId {
  PigeonFirebaseApp *pigeonResult = [[PigeonFirebaseApp alloc] init];
  pigeonResult.appName = appName;
  pigeonResult.tenantId = tenantId;
  return pigeonResult;
}
+ (PigeonFirebaseApp *)fromList:(NSArray *)list {
  PigeonFirebaseApp *pigeonResult = [[PigeonFirebaseApp alloc] init];
  pigeonResult.appName = GetNullableObjectAtIndex(list, 0);
  NSAssert(pigeonResult.appName != nil, @"");
  pigeonResult.tenantId = GetNullableObjectAtIndex(list, 1);
  return pigeonResult;
}
+ (nullable PigeonFirebaseApp *)nullableFromList:(NSArray *)list {
  return (list) ? [PigeonFirebaseApp fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    (self.appName ?: [NSNull null]),
    (self.tenantId ?: [NSNull null]),
  ];
}
@end

@interface FirebaseAuthHostApiCodecReader : FlutterStandardReader
@end
@implementation FirebaseAuthHostApiCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128:
      return [PigeonFirebaseApp fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface FirebaseAuthHostApiCodecWriter : FlutterStandardWriter
@end
@implementation FirebaseAuthHostApiCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[PigeonFirebaseApp class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface FirebaseAuthHostApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation FirebaseAuthHostApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[FirebaseAuthHostApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[FirebaseAuthHostApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *FirebaseAuthHostApiGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    FirebaseAuthHostApiCodecReaderWriter *readerWriter =
        [[FirebaseAuthHostApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void FirebaseAuthHostApiSetup(id<FlutterBinaryMessenger> binaryMessenger,
                              NSObject<FirebaseAuthHostApi> *api) {
  {
    FlutterBasicMessageChannel *channel = [[FlutterBasicMessageChannel alloc]
           initWithName:@"dev.flutter.pigeon.FirebaseAuthHostApi.registerIdTokenListener"
        binaryMessenger:binaryMessenger
                  codec:FirebaseAuthHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(registerIdTokenListenerApp:completion:)],
                @"FirebaseAuthHostApi api (%@) doesn't respond to "
                @"@selector(registerIdTokenListenerApp:completion:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        PigeonFirebaseApp *arg_app = GetNullableObjectAtIndex(args, 0);
        [api registerIdTokenListenerApp:arg_app
                             completion:^(NSString *_Nullable output,
                                          FlutterError *_Nullable error) {
                               callback(wrapResult(output, error));
                             }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [[FlutterBasicMessageChannel alloc]
           initWithName:@"dev.flutter.pigeon.FirebaseAuthHostApi.registerAuthStateListener"
        binaryMessenger:binaryMessenger
                  codec:FirebaseAuthHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(registerAuthStateListenerApp:completion:)],
                @"FirebaseAuthHostApi api (%@) doesn't respond to "
                @"@selector(registerAuthStateListenerApp:completion:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        PigeonFirebaseApp *arg_app = GetNullableObjectAtIndex(args, 0);
        [api registerAuthStateListenerApp:arg_app
                               completion:^(NSString *_Nullable output,
                                            FlutterError *_Nullable error) {
                                 callback(wrapResult(output, error));
                               }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [[FlutterBasicMessageChannel alloc]
           initWithName:@"dev.flutter.pigeon.FirebaseAuthHostApi.useEmulator"
        binaryMessenger:binaryMessenger
                  codec:FirebaseAuthHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(useEmulatorApp:host:port:completion:)],
                @"FirebaseAuthHostApi api (%@) doesn't respond to "
                @"@selector(useEmulatorApp:host:port:completion:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        PigeonFirebaseApp *arg_app = GetNullableObjectAtIndex(args, 0);
        NSString *arg_host = GetNullableObjectAtIndex(args, 1);
        NSNumber *arg_port = GetNullableObjectAtIndex(args, 2);
        [api useEmulatorApp:arg_app
                       host:arg_host
                       port:arg_port
                 completion:^(FlutterError *_Nullable error) {
                   callback(wrapResult(nil, error));
                 }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [[FlutterBasicMessageChannel alloc]
           initWithName:@"dev.flutter.pigeon.FirebaseAuthHostApi.applyActionCode"
        binaryMessenger:binaryMessenger
                  codec:FirebaseAuthHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(applyActionCodeApp:code:completion:)],
                @"FirebaseAuthHostApi api (%@) doesn't respond to "
                @"@selector(applyActionCodeApp:code:completion:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        PigeonFirebaseApp *arg_app = GetNullableObjectAtIndex(args, 0);
        NSString *arg_code = GetNullableObjectAtIndex(args, 1);
        [api applyActionCodeApp:arg_app
                           code:arg_code
                     completion:^(FlutterError *_Nullable error) {
                       callback(wrapResult(nil, error));
                     }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
@interface MultiFactorUserHostApiCodecReader : FlutterStandardReader
@end
@implementation MultiFactorUserHostApiCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128:
      return [PigeonMultiFactorInfo fromList:[self readValue]];
    case 129:
      return [PigeonMultiFactorSession fromList:[self readValue]];
    case 130:
      return [PigeonPhoneMultiFactorAssertion fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface MultiFactorUserHostApiCodecWriter : FlutterStandardWriter
@end
@implementation MultiFactorUserHostApiCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[PigeonMultiFactorInfo class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[PigeonMultiFactorSession class]]) {
    [self writeByte:129];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[PigeonPhoneMultiFactorAssertion class]]) {
    [self writeByte:130];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface MultiFactorUserHostApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation MultiFactorUserHostApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[MultiFactorUserHostApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[MultiFactorUserHostApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *MultiFactorUserHostApiGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    MultiFactorUserHostApiCodecReaderWriter *readerWriter =
        [[MultiFactorUserHostApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void MultiFactorUserHostApiSetup(id<FlutterBinaryMessenger> binaryMessenger,
                                 NSObject<MultiFactorUserHostApi> *api) {
  {
    FlutterBasicMessageChannel *channel = [[FlutterBasicMessageChannel alloc]
           initWithName:@"dev.flutter.pigeon.MultiFactorUserHostApi.enrollPhone"
        binaryMessenger:binaryMessenger
                  codec:MultiFactorUserHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(enrollPhoneAppName:
                                                           assertion:displayName:completion:)],
                @"MultiFactorUserHostApi api (%@) doesn't respond to "
                @"@selector(enrollPhoneAppName:assertion:displayName:completion:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_appName = GetNullableObjectAtIndex(args, 0);
        PigeonPhoneMultiFactorAssertion *arg_assertion = GetNullableObjectAtIndex(args, 1);
        NSString *arg_displayName = GetNullableObjectAtIndex(args, 2);
        [api enrollPhoneAppName:arg_appName
                      assertion:arg_assertion
                    displayName:arg_displayName
                     completion:^(FlutterError *_Nullable error) {
                       callback(wrapResult(nil, error));
                     }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [[FlutterBasicMessageChannel alloc]
           initWithName:@"dev.flutter.pigeon.MultiFactorUserHostApi.getSession"
        binaryMessenger:binaryMessenger
                  codec:MultiFactorUserHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getSessionAppName:completion:)],
                @"MultiFactorUserHostApi api (%@) doesn't respond to "
                @"@selector(getSessionAppName:completion:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_appName = GetNullableObjectAtIndex(args, 0);
        [api getSessionAppName:arg_appName
                    completion:^(PigeonMultiFactorSession *_Nullable output,
                                 FlutterError *_Nullable error) {
                      callback(wrapResult(output, error));
                    }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [[FlutterBasicMessageChannel alloc]
           initWithName:@"dev.flutter.pigeon.MultiFactorUserHostApi.unenroll"
        binaryMessenger:binaryMessenger
                  codec:MultiFactorUserHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(unenrollAppName:factorUid:completion:)],
                @"MultiFactorUserHostApi api (%@) doesn't respond to "
                @"@selector(unenrollAppName:factorUid:completion:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_appName = GetNullableObjectAtIndex(args, 0);
        NSString *arg_factorUid = GetNullableObjectAtIndex(args, 1);
        [api unenrollAppName:arg_appName
                   factorUid:arg_factorUid
                  completion:^(FlutterError *_Nullable error) {
                    callback(wrapResult(nil, error));
                  }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel = [[FlutterBasicMessageChannel alloc]
           initWithName:@"dev.flutter.pigeon.MultiFactorUserHostApi.getEnrolledFactors"
        binaryMessenger:binaryMessenger
                  codec:MultiFactorUserHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(getEnrolledFactorsAppName:completion:)],
                @"MultiFactorUserHostApi api (%@) doesn't respond to "
                @"@selector(getEnrolledFactorsAppName:completion:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_appName = GetNullableObjectAtIndex(args, 0);
        [api getEnrolledFactorsAppName:arg_appName
                            completion:^(NSArray<PigeonMultiFactorInfo *> *_Nullable output,
                                         FlutterError *_Nullable error) {
                              callback(wrapResult(output, error));
                            }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
@interface MultiFactoResolverHostApiCodecReader : FlutterStandardReader
@end
@implementation MultiFactoResolverHostApiCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128:
      return [PigeonFirebaseApp fromList:[self readValue]];
    case 129:
      return [PigeonMultiFactorInfo fromList:[self readValue]];
    case 130:
      return [PigeonMultiFactorSession fromList:[self readValue]];
    case 131:
      return [PigeonPhoneMultiFactorAssertion fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface MultiFactoResolverHostApiCodecWriter : FlutterStandardWriter
@end
@implementation MultiFactoResolverHostApiCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[PigeonFirebaseApp class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[PigeonMultiFactorInfo class]]) {
    [self writeByte:129];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[PigeonMultiFactorSession class]]) {
    [self writeByte:130];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[PigeonPhoneMultiFactorAssertion class]]) {
    [self writeByte:131];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface MultiFactoResolverHostApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation MultiFactoResolverHostApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[MultiFactoResolverHostApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[MultiFactoResolverHostApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *MultiFactoResolverHostApiGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    MultiFactoResolverHostApiCodecReaderWriter *readerWriter =
        [[MultiFactoResolverHostApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void MultiFactoResolverHostApiSetup(id<FlutterBinaryMessenger> binaryMessenger,
                                    NSObject<MultiFactoResolverHostApi> *api) {
  {
    FlutterBasicMessageChannel *channel = [[FlutterBasicMessageChannel alloc]
           initWithName:@"dev.flutter.pigeon.MultiFactoResolverHostApi.resolveSignIn"
        binaryMessenger:binaryMessenger
                  codec:MultiFactoResolverHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(resolveSignInResolverId:assertion:completion:)],
                @"MultiFactoResolverHostApi api (%@) doesn't respond to "
                @"@selector(resolveSignInResolverId:assertion:completion:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_resolverId = GetNullableObjectAtIndex(args, 0);
        PigeonPhoneMultiFactorAssertion *arg_assertion = GetNullableObjectAtIndex(args, 1);
        [api resolveSignInResolverId:arg_resolverId
                           assertion:arg_assertion
                          completion:^(NSDictionary<NSString *, id> *_Nullable output,
                                       FlutterError *_Nullable error) {
                            callback(wrapResult(output, error));
                          }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
@interface GenerateInterfacesCodecReader : FlutterStandardReader
@end
@implementation GenerateInterfacesCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128:
      return [PigeonMultiFactorInfo fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface GenerateInterfacesCodecWriter : FlutterStandardWriter
@end
@implementation GenerateInterfacesCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[PigeonMultiFactorInfo class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface GenerateInterfacesCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation GenerateInterfacesCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[GenerateInterfacesCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[GenerateInterfacesCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *GenerateInterfacesGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    GenerateInterfacesCodecReaderWriter *readerWriter =
        [[GenerateInterfacesCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void GenerateInterfacesSetup(id<FlutterBinaryMessenger> binaryMessenger,
                             NSObject<GenerateInterfaces> *api) {
  {
    FlutterBasicMessageChannel *channel = [[FlutterBasicMessageChannel alloc]
           initWithName:@"dev.flutter.pigeon.GenerateInterfaces.generateInterfaces"
        binaryMessenger:binaryMessenger
                  codec:GenerateInterfacesGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(generateInterfacesInfo:error:)],
                @"GenerateInterfaces api (%@) doesn't respond to "
                @"@selector(generateInterfacesInfo:error:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        PigeonMultiFactorInfo *arg_info = GetNullableObjectAtIndex(args, 0);
        FlutterError *error;
        [api generateInterfacesInfo:arg_info error:&error];
        callback(wrapResult(nil, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
