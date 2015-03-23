//
//  Ouralabs
//
//  Copyright (c) 2014 Ouralabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#define OUDouble(value, scaleValue)  ([OUDouble doubleWithDouble:value scale:scaleValue])

typedef NS_ENUM(NSInteger, OULogLevel) {
    OULogLevelTrace,
    OULogLevelDebug,
    OULogLevelInfo,
    OULogLevelWarn,
    OULogLevelError,
    OULogLevelFatal
};

OBJC_EXTERN void __attribute__((overloadable)) OULogTrace(NSString *tag, NSString *message, ...) NS_FORMAT_FUNCTION(2, 3);
OBJC_EXTERN void __attribute__((overloadable)) OULogTrace(NSString *tag, NSString *message, NSException *exception);
OBJC_EXTERN void __attribute__((overloadable)) OULogTrace(NSString *tag, NSString *message, NSError *error);
OBJC_EXTERN void __attribute__((overloadable)) OULogTrace(NSString *tag, NSString *message, NSDictionary *kvp);
OBJC_EXTERN void __attribute__((overloadable)) OULogTrace(NSString *tag, NSException *exception);
OBJC_EXTERN void __attribute__((overloadable)) OULogTrace(NSString *tag, NSError *error);

OBJC_EXTERN void __attribute__((overloadable)) OULogDebug(NSString *tag, NSString *message, ...) NS_FORMAT_FUNCTION(2, 3);
OBJC_EXTERN void __attribute__((overloadable)) OULogDebug(NSString *tag, NSString *message, NSException *exception);
OBJC_EXTERN void __attribute__((overloadable)) OULogDebug(NSString *tag, NSString *message, NSError *error);
OBJC_EXTERN void __attribute__((overloadable)) OULogDebug(NSString *tag, NSString *message, NSDictionary *kvp);
OBJC_EXTERN void __attribute__((overloadable)) OULogDebug(NSString *tag, NSException *exception);
OBJC_EXTERN void __attribute__((overloadable)) OULogDebug(NSString *tag, NSError *error);

OBJC_EXTERN void __attribute__((overloadable)) OULogInfo(NSString *tag, NSString *message, ...) NS_FORMAT_FUNCTION(2, 3);
OBJC_EXTERN void __attribute__((overloadable)) OULogInfo(NSString *tag, NSString *message, NSException *exception);
OBJC_EXTERN void __attribute__((overloadable)) OULogInfo(NSString *tag, NSString *message, NSError *error);
OBJC_EXTERN void __attribute__((overloadable)) OULogInfo(NSString *tag, NSString *message, NSDictionary *kvp);
OBJC_EXTERN void __attribute__((overloadable)) OULogInfo(NSString *tag, NSException *exception);
OBJC_EXTERN void __attribute__((overloadable)) OULogInfo(NSString *tag, NSError *error);

OBJC_EXTERN void __attribute__((overloadable)) OULogWarn(NSString *tag, NSString *message, ...) NS_FORMAT_FUNCTION(2, 3);
OBJC_EXTERN void __attribute__((overloadable)) OULogWarn(NSString *tag, NSString *message, NSException *exception);
OBJC_EXTERN void __attribute__((overloadable)) OULogWarn(NSString *tag, NSString *message, NSError *error);
OBJC_EXTERN void __attribute__((overloadable)) OULogWarn(NSString *tag, NSString *message, NSDictionary *kvp);
OBJC_EXTERN void __attribute__((overloadable)) OULogWarn(NSString *tag, NSException *exception);
OBJC_EXTERN void __attribute__((overloadable)) OULogWarn(NSString *tag, NSError *error);

OBJC_EXTERN void __attribute__((overloadable)) OULogError(NSString *tag, NSString *message, ...) NS_FORMAT_FUNCTION(2, 3);
OBJC_EXTERN void __attribute__((overloadable)) OULogError(NSString *tag, NSString *message, NSException *exception);
OBJC_EXTERN void __attribute__((overloadable)) OULogError(NSString *tag, NSString *message, NSError *error);
OBJC_EXTERN void __attribute__((overloadable)) OULogError(NSString *tag, NSString *message, NSDictionary *kvp);
OBJC_EXTERN void __attribute__((overloadable)) OULogError(NSString *tag, NSException *exception);
OBJC_EXTERN void __attribute__((overloadable)) OULogError(NSString *tag, NSError *error);

OBJC_EXTERN void __attribute__((overloadable)) OULogFatal(NSString *tag, NSString *message, ...) NS_FORMAT_FUNCTION(2, 3);
OBJC_EXTERN void __attribute__((overloadable)) OULogFatal(NSString *tag, NSString *message, NSException *exception);
OBJC_EXTERN void __attribute__((overloadable)) OULogFatal(NSString *tag, NSString *message, NSError *error);
OBJC_EXTERN void __attribute__((overloadable)) OULogFatal(NSString *tag, NSString *message, NSDictionary *kvp);
OBJC_EXTERN void __attribute__((overloadable)) OULogFatal(NSString *tag, NSException *exception);
OBJC_EXTERN void __attribute__((overloadable)) OULogFatal(NSString *tag, NSError *error);

OBJC_EXTERN void __attribute__((overloadable)) OULog(OULogLevel level, NSString *tag, NSString *message, ...) NS_FORMAT_FUNCTION(3, 4);
OBJC_EXTERN void __attribute__((overloadable)) OULog(OULogLevel level, NSString *tag, NSString *message, NSException *exception);
OBJC_EXTERN void __attribute__((overloadable)) OULog(OULogLevel level, NSString *tag, NSString *message, NSError *error);
OBJC_EXTERN void __attribute__((overloadable)) OULog(OULogLevel level, NSString *tag, NSString *message, NSDictionary *kvp);
OBJC_EXTERN void __attribute__((overloadable)) OULog(OULogLevel level, NSString *tag, NSException *exception);
OBJC_EXTERN void __attribute__((overloadable)) OULog(OULogLevel level, NSString *tag, NSError *error);

extern NSString *const OUAttr1;
extern NSString *const OUAttr2;
extern NSString *const OUAttr3;

@interface OUDouble : NSObject
@property (assign) double doubleValue;
@property (assign) NSInteger scale;

- (NSString *)stringValue;

+ (OUDouble *)doubleWithDouble:(double)value scale:(NSInteger)scale;

@end

@interface Ouralabs : NSObject

+ (void)initWithKey:(NSString *)key;

+ (void)setLiveTail:(NSNumber *)liveTail;
+ (void)setAppVersion:(NSString *)appVersion;
+ (void)setLogLevel:(NSNumber *)logLevel;
+ (void)setAttributes:(NSDictionary *)attributes;
+ (void)setOptIn:(BOOL)optIn;
+ (void)setDiskOnly:(NSNumber *)diskOnly;
+ (void)setBuffered:(NSNumber *)buffered;
+ (void)setLocation:(CLLocation *)location;
+ (void)setDisableTimedOperations:(BOOL)disable;
+ (void)setLoggerLogsAllowed:(NSNumber *)allowed;

+ (BOOL)getInitialized;
+ (BOOL)getLiveTail;
+ (OULogLevel)getLogLevel;
+ (BOOL)getOptIn;
+ (BOOL)getDiskOnly;
+ (BOOL)getBuffered;
+ (NSString *)getAppVersion;
+ (NSString *)getVersion;
+ (NSDictionary *)getAttributes;
+ (CLLocation *)getLocation;
+ (BOOL)getDisableTimedOperations;
+ (BOOL)getLoggerLogsAllowed;

+ (void)update;
+ (void)flush;

+ (void)t:(NSString *)tag message:(NSString *)message, ...;
+ (void)t:(NSString *)tag message:(NSString *)message args:(va_list)args;
+ (void)t:(NSString *)tag message:(NSString *)message exception:(NSException *)exception;
+ (void)t:(NSString *)tag message:(NSString *)message error:(NSError *)error;
+ (void)t:(NSString *)tag message:(NSString *)message kvp:(NSDictionary *)kvp;
+ (void)t:(NSString *)tag error:(NSError *)error;
+ (void)t:(NSString *)tag exception:(NSException *)exception;

+ (void)d:(NSString *)tag message:(NSString *)message, ...;
+ (void)d:(NSString *)tag message:(NSString *)message args:(va_list)args;
+ (void)d:(NSString *)tag message:(NSString *)message exception:(NSException *)exception;
+ (void)d:(NSString *)tag message:(NSString *)message error:(NSError *)error;
+ (void)d:(NSString *)tag message:(NSString *)message kvp:(NSDictionary *)kvp;
+ (void)d:(NSString *)tag error:(NSError *)error;
+ (void)d:(NSString *)tag exception:(NSException *)exception;

+ (void)i:(NSString *)tag message:(NSString *)message, ...;
+ (void)i:(NSString *)tag message:(NSString *)message args:(va_list)args;
+ (void)i:(NSString *)tag message:(NSString *)message exception:(NSException *)exception;
+ (void)i:(NSString *)tag message:(NSString *)message error:(NSError *)error;
+ (void)i:(NSString *)tag message:(NSString *)message kvp:(NSDictionary *)kvp;
+ (void)i:(NSString *)tag error:(NSError *)error;
+ (void)i:(NSString *)tag exception:(NSException *)exception;

+ (void)w:(NSString *)tag message:(NSString *)message, ...;
+ (void)w:(NSString *)tag message:(NSString *)message args:(va_list)args;
+ (void)w:(NSString *)tag message:(NSString *)message exception:(NSException *)exception;
+ (void)w:(NSString *)tag message:(NSString *)message error:(NSError *)error;
+ (void)w:(NSString *)tag message:(NSString *)message kvp:(NSDictionary *)kvp;
+ (void)w:(NSString *)tag error:(NSError *)error;
+ (void)w:(NSString *)tag exception:(NSException *)exception;

+ (void)e:(NSString *)tag message:(NSString *)message, ...;
+ (void)e:(NSString *)tag message:(NSString *)message args:(va_list)args;
+ (void)e:(NSString *)tag message:(NSString *)message exception:(NSException *)exception;
+ (void)e:(NSString *)tag message:(NSString *)message error:(NSError *)error;
+ (void)e:(NSString *)tag message:(NSString *)message kvp:(NSDictionary *)kvp;
+ (void)e:(NSString *)tag error:(NSError *)error;
+ (void)e:(NSString *)tag exception:(NSException *)exception;

+ (void)f:(NSString *)tag message:(NSString *)message, ...;
+ (void)f:(NSString *)tag message:(NSString *)message args:(va_list)args;
+ (void)f:(NSString *)tag message:(NSString *)message exception:(NSException *)exception;
+ (void)f:(NSString *)tag message:(NSString *)message error:(NSError *)error;
+ (void)f:(NSString *)tag message:(NSString *)message kvp:(NSDictionary *)kvp;
+ (void)f:(NSString *)tag error:(NSError *)error;
+ (void)f:(NSString *)tag exception:(NSException *)exception;

+ (void)log:(OULogLevel)level tag:(NSString *)tag message:(NSString *)message, ...;
+ (void)log:(OULogLevel)level tag:(NSString *)tag message:(NSString *)message args:(va_list)args;
+ (void)log:(OULogLevel)level tag:(NSString *)tag message:(NSString *)message exception:(NSException *)exception;
+ (void)log:(OULogLevel)level tag:(NSString *)tag message:(NSString *)message error:(NSError *)error;
+ (void)log:(OULogLevel)level tag:(NSString *)tag message:(NSString *)message kvp:(NSDictionary *)kvp;
+ (void)log:(OULogLevel)level tag:(NSString *)tag error:(NSError *)error;
+ (void)log:(OULogLevel)level tag:(NSString *)tag exception:(NSException *)exception;

@end