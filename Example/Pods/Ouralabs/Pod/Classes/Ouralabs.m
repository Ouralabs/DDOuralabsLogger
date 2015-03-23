//
//  Ouralabs
//
//  Copyright (c) 2014 Ouralabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <UIKit/UIKit.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <arpa/inet.h>
#import <sys/utsname.h>
#import <pthread.h>
#import <zlib.h>

#import "Ouralabs.h"

#define now() ([[NSDate date] timeIntervalSince1970])
#define simulator() ([SIMULATOR_NAME_ID isEqualToString:sNameID])

#pragma mark - Trace C Methods

void __attribute__((overloadable)) OULogTrace(NSString *tag, NSString *message, ...) {
    va_list args;
    va_start(args, message);
    [Ouralabs t:tag message:message args:args];
    va_end(args);
}

void __attribute__((overloadable)) OULogTrace(NSString *tag, NSString *message, NSDictionary *kvp) {
    [Ouralabs t:tag message:message kvp:kvp];
}

void __attribute__((overloadable)) OULogTrace(NSString *tag, NSString *message, NSException *exception) {
    [Ouralabs t:tag message:message exception:exception];
}

void __attribute__((overloadable)) OULogTrace(NSString *tag, NSString *message, NSError *error) {
    [Ouralabs t:tag message:message error:error];
}

void __attribute__((overloadable)) OULogTrace(NSString *tag, NSException *exception) {
    [Ouralabs t:tag exception:exception];
}

void __attribute__((overloadable)) OULogTrace(NSString *tag, NSError *error) {
    [Ouralabs t:tag error:error];
}

#pragma mark - Debug C Methods

void __attribute__((overloadable)) OULogDebug(NSString *tag, NSString *message, ...) {
    va_list args;
    va_start(args, message);
    [Ouralabs d:tag message:message args:args];
    va_end(args);
}

void __attribute__((overloadable)) OULogDebug(NSString *tag, NSString *message, NSDictionary *kvp) {
    [Ouralabs d:tag message:message kvp:kvp];
}

void __attribute__((overloadable)) OULogDebug(NSString *tag, NSString *message, NSException *exception) {
    [Ouralabs d:tag message:message exception:exception];
}

void __attribute__((overloadable)) OULogDebug(NSString *tag, NSString *message, NSError *error) {
    [Ouralabs d:tag message:message error:error];
}

void __attribute__((overloadable)) OULogDebug(NSString *tag, NSException *exception) {
    [Ouralabs d:tag exception:exception];
}

void __attribute__((overloadable)) OULogDebug(NSString *tag, NSError *error) {
    [Ouralabs d:tag error:error];
}

#pragma mark - Info C Methods

void __attribute__((overloadable)) OULogInfo(NSString *tag, NSString *message, ...) {
    va_list args;
    va_start(args, message);
    [Ouralabs i:tag message:message args:args];
    va_end(args);
}

void __attribute__((overloadable)) OULogInfo(NSString *tag, NSString *message, NSDictionary *kvp) {
    [Ouralabs i:tag message:message kvp:kvp];
}

void __attribute__((overloadable)) OULogInfo(NSString *tag, NSString *message, NSException *exception) {
    [Ouralabs i:tag message:message exception:exception];
}

void __attribute__((overloadable)) OULogInfo(NSString *tag, NSString *message, NSError *error) {
    [Ouralabs i:tag message:message error:error];
}

void __attribute__((overloadable)) OULogInfo(NSString *tag, NSException *exception) {
    [Ouralabs i:tag exception:exception];
}

void __attribute__((overloadable)) OULogInfo(NSString *tag, NSError *error) {
    [Ouralabs i:tag error:error];
}

#pragma mark - Warn C Methods

void __attribute__((overloadable)) OULogWarn(NSString *tag, NSString *message, ...) {
    va_list args;
    va_start(args, message);
    [Ouralabs w:tag message:message args:args];
    va_end(args);
}

void __attribute__((overloadable)) OULogWarn(NSString *tag, NSString *message, NSDictionary *kvp) {
    [Ouralabs w:tag message:message kvp:kvp];
}

void __attribute__((overloadable)) OULogWarn(NSString *tag, NSString *message, NSException *exception) {
    [Ouralabs w:tag message:message exception:exception];
}

void __attribute__((overloadable)) OULogWarn(NSString *tag, NSString *message, NSError *error) {
    [Ouralabs w:tag message:message error:error];
}

void __attribute__((overloadable)) OULogWarn(NSString *tag, NSException *exception) {
    [Ouralabs w:tag exception:exception];
}

void __attribute__((overloadable)) OULogWarn(NSString *tag, NSError *error) {
    [Ouralabs w:tag error:error];
}

#pragma mark - Error C Methods

void __attribute__((overloadable)) OULogError(NSString *tag, NSString *message, ...) {
    va_list args;
    va_start(args, message);
    [Ouralabs e:tag message:message args:args];
    va_end(args);
}

void __attribute__((overloadable)) OULogError(NSString *tag, NSString *message, NSDictionary *kvp) {
    [Ouralabs e:tag message:message kvp:kvp];
}

void __attribute__((overloadable)) OULogError(NSString *tag, NSString *message, NSException *exception) {
    [Ouralabs e:tag message:message exception:exception];
}

void __attribute__((overloadable)) OULogError(NSString *tag, NSString *message, NSError *error) {
    [Ouralabs e:tag message:message error:error];
}

void __attribute__((overloadable)) OULogError(NSString *tag, NSException *exception) {
    [Ouralabs e:tag exception:exception];
}

void __attribute__((overloadable)) OULogError(NSString *tag, NSError *error) {
    [Ouralabs e:tag error:error];
}

#pragma mark - Fatal C Methods

void __attribute__((overloadable)) OULogFatal(NSString *tag, NSString *message, ...) {
    va_list args;
    va_start(args, message);
    [Ouralabs f:tag message:message args:args];
    va_end(args);
}

void __attribute__((overloadable)) OULogFatal(NSString *tag, NSString *message, NSDictionary *kvp) {
    [Ouralabs f:tag message:message kvp:kvp];
}

void __attribute__((overloadable)) OULogFatal(NSString *tag, NSString *message, NSException *exception) {
    [Ouralabs f:tag message:message exception:exception];
}

void __attribute__((overloadable)) OULogFatal(NSString *tag, NSString *message, NSError *error) {
    [Ouralabs f:tag message:message error:error];
}

void __attribute__((overloadable)) OULogFatal(NSString *tag, NSException *exception) {
    [Ouralabs f:tag exception:exception];
}

void __attribute__((overloadable)) OULogFatal(NSString *tag, NSError *error) {
    [Ouralabs f:tag error:error];
}

#pragma mark - Log Methods

void __attribute__((overloadable)) OULog(OULogLevel level, NSString *tag, NSString *message, ...) {
    va_list args;
    va_start(args, message);
    [Ouralabs log:level tag:tag message:message args:args];
    va_end(args);
}

void __attribute__((overloadable)) OULog(OULogLevel level, NSString *tag, NSString *message, NSException *exception) {
    [Ouralabs log:level tag:tag message:message exception:exception];
}

void __attribute__((overloadable)) OULog(OULogLevel level, NSString *tag, NSString *message, NSError *error) {
    [Ouralabs log:level tag:tag message:message error:error];
}

void __attribute__((overloadable)) OULog(OULogLevel level, NSString *tag, NSString *message, NSDictionary *kvp) {
    [Ouralabs log:level tag:tag message:message kvp:kvp];
}

void __attribute__((overloadable)) OULog(OULogLevel level, NSString *tag, NSException *exception) {
    [Ouralabs log:level tag:tag exception:exception];
}

void __attribute__((overloadable)) OULog(OULogLevel level, NSString *tag, NSError *error) {
    [Ouralabs log:level tag:tag error:error];
}

#pragma mark - Constants

NSString *const OUAttr1 = @"attr_1";
NSString *const OUAttr2 = @"attr_2";
NSString *const OUAttr3 = @"attr_3";

static NSString *const TAG = @"Ouralabs";

static NSString *const VERSION = @"2.1.1";

static NSString *const SETTING_API_SCHEME = @"api_scheme";
static NSString *const SETTING_API_HOST = @"api_host";
static NSString *const SETTING_API_TIMEOUT = @"api_timeout";
static NSString *const SETTING_LOG_LEVEL = @"log_level";
static NSString *const SETTING_MAX_FILE_SIZE = @"max_file_size";
static NSString *const SETTING_MAX_SIZE = @"max_size";
static NSString *const SETTING_UPLOAD_INTERVAL_LIVE_TAIL = @"upload_interval_live_tail";
static NSString *const SETTING_UPLOAD_INTERVAL_WIFI = @"upload_interval_wifi";
static NSString *const SETTING_UPLOAD_INTERVAL_WWAN = @"upload_interval_wwan";
static NSString *const SETTING_EXPIRATION = @"expiration";
static NSString *const SETTING_LIVE_TAIL = @"live_tail";
static NSString *const SETTING_CERTIFICATE = @"certificate";
static NSString *const SETTING_DISK_ONLY = @"disk_only";
static NSString *const SETTING_BUFFERED = @"buffered";
static NSString *const SETTING_LOGGER_LOGS_ALLOWED = @"logger_logs_allowed";
static NSString *const _SETTING_ATTR_1 = @"_attr_1";
static NSString *const _SETTING_ATTR_2 = @"_attr_2";
static NSString *const _SETTING_ATTR_3 = @"_attr_3";
static NSString *const _SETTING_OPT_IN = @"_opt_in";

static NSString *const SIMULATOR_NAME_ID = @"9d01f78146eacdfffb68d967b27c51790a94db0871b66e6d2bf5e8350a53e6a0";

#pragma mark - OUDouble

@implementation OUDouble

- (id)initWithDouble:(double)doubleValue scale:(NSInteger)scale {
    if (self = [super init]) {
        _doubleValue = doubleValue;
        _scale = scale;
    }
    return self;
}

+ (OUDouble *)doubleWithDouble:(double)value scale:(NSInteger)scale {
    return [[OUDouble alloc] initWithDouble:value scale:scale];
}

- (NSString *)stringValue {
    NSMutableString *format = [[NSMutableString alloc] initWithString:@"%."];
    [format appendString:[@(self.scale) stringValue]];
    [format appendString:@"f"];

    return [NSString stringWithFormat:format, [self doubleValue]];
}

@end

#pragma mark - OULog

@interface OULogInternal : NSObject
@property (nonatomic, strong) CLLocation *location;
@property (nonatomic, strong) NSString *thread;
@property (nonatomic, assign) NSTimeInterval time;
@property (nonatomic, strong) NSNumber *level;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *message;
- (OULogInternal *)initWithLocation:(CLLocation *)location thread:(NSString *)thread time:(NSTimeInterval)time level:(NSNumber *)level tag:(NSString *)tag message:(NSString *)message;
@end

@implementation OULogInternal
- (OULogInternal *)initWithLocation:(CLLocation *)location thread:(NSString *)thread time:(NSTimeInterval)time level:(NSNumber *)level tag:(NSString *)tag message:(NSString *)message {
    if (self = [super init]) {
        _location = location;
        _thread = thread;
        _time = time;
        _level = level;
        _tag = tag;
        _message = message;
    }
    return self;
}
@end

#pragma mark - Ouralabs

@implementation Ouralabs

static NSRecursiveLock *sLock;

static NSOperationQueue *sOperationQueue;
static SCNetworkReachabilityRef sReachabilityRef;
static BOOL sInitialized;
static NSString *sChannelKey;
static NSNumber *sLogLevel;
static NSNumber *sLiveTail;
static NSNumber *sDiskOnly;
static NSNumber *sBuffered;
static NSMutableArray *sQueue;
static NSMutableDictionary *sSettings;
static NSString *sAppIdentifier;
static NSString *sAppVersion;
static NSString *sNameID;
static NSMutableDictionary *sAttributes;
static CLLocation *sLocation;
static BOOL sDisableTimedOperations;
static NSNumber *sLoggerLogsAllowed;

static SecKeyRef sPublicKey;

static NSString *sLibraryFile;
static NSString *sFile;
static NSMutableArray *sFiles;
static NSFileHandle *sFileHandle;
static NSFileManager *sFileManager;

typedef void (^OUResponse) (NSInteger statusCode, NSDictionary *dict, NSError *error);

static dispatch_block_t sSettingsBlock;
static dispatch_block_t sUploadBlock;
static dispatch_block_t sQueueBlock;

static NSTimer *sSettingsTimer;
static NSTimer *sUploadTimer;

#pragma mark - Static Init

+ (void)initialize {
    if (self == [Ouralabs class]) {
        @synchronized(self) {
            sOperationQueue = [[NSOperationQueue alloc] init];
            sOperationQueue.name = @"com.ouralabs";
            sOperationQueue.maxConcurrentOperationCount = 1;
            
            sLock = [NSRecursiveLock new];
            sQueue = [NSMutableArray new];
            sFileManager = [NSFileManager defaultManager];
            sLibraryFile = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            sSettings = [NSMutableDictionary new];
            
            struct sockaddr_in zeroaddr;
            bzero(&zeroaddr, sizeof(zeroaddr));
            zeroaddr.sin_len = sizeof(zeroaddr);
            zeroaddr.sin_family = AF_INET;
            sReachabilityRef = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, (const struct sockaddr*) &zeroaddr);
            
            sSettingsBlock = ^{
                if (simulator()) {
                    OULogWarn(TAG, @"Cannot update settings. Simulator is not supported");
                    return;
                }
                
                if ([self isConnected]) {
                    NSTimeInterval start = now();
                    
                    NSString *base = [NSString stringWithFormat:@"api/v1/channels/%@/settings?", sChannelKey];
                    
                    base = [self appendQueryParams:base dict:[self device]];
                    
                    [self makeRequest:base body:nil response:^(NSInteger statusCode, NSDictionary *dict, NSError *error) {
                        NSTimeInterval delta = now() - start;
                        
                        if (statusCode == 200) {
                            [sLock lock];
                            for (NSString *key in [dict allKeys]) {
                                id val = dict[key];
                                
                                sSettings[key] = val;
                            }
                            [self updateFiles];
                            [self loadPublicKey];
                            [sLock unlock];
                            
                            [self saveSettings];
                        } else {
                            if (error) {
                                if ([self getLoggerLogsAllowed])
                                    OULogError(TAG, @"Could not retrieve settings.", @{@"time" : OUDouble(delta, 3),
                                                                                       @"error" : error.description,
                                                                                       @"status" : @(statusCode)});
                            } else {
                                if ([self getLoggerLogsAllowed])
                                    OULogError(TAG, @"Could not retrieve settings.", @{@"time" : OUDouble(delta, 3),
                                                                                       @"error" : dict[@"error"],
                                                                                       @"status" : @(statusCode)});
                            }
                        }
                        
                    }];
                } else {
                    if ([self getLoggerLogsAllowed]) OULogWarn(TAG, @"Could not update settings. Not connected to the internet.");
                }
                
                if ([self getDisableTimedOperations]) return;
                
                NSTimeInterval nextDispatch = [self nextDispatch:[sSettings[SETTING_EXPIRATION] doubleValue]];
                
                if (sSettingsTimer) [sSettingsTimer invalidate];
                
                sSettingsTimer = [NSTimer timerWithTimeInterval:nextDispatch
                                                         target:self
                                                       selector:@selector(dispatchTimer:)
                                                       userInfo:sSettingsBlock
                                                        repeats:NO];
                [[NSRunLoop mainRunLoop] addTimer:sSettingsTimer forMode:NSRunLoopCommonModes];
            };
            
            sUploadBlock = ^{
                if (simulator()) {
                    OULogWarn(TAG, @"Cannot upload. Simulator is not supported");
                    return;
                }
                
                if ([self isConnected]) {
                    NSMutableArray *files;
                    
                    NSString *base = [NSString stringWithFormat:@"api/v1/channels/%@/logs?", sChannelKey];
                    
                    NSString *workingDir = [self workingDirectory];
                    
                    [sLock lock];
                    [self rollFile];
                    
                    files = [self sort:[self filter:[self listFiles:[self directory]]]];
                    
                    // copy files
                    for (NSString *file in files) {
                        NSString *outPath = [[self workingDirectory] stringByAppendingPathComponent:[file lastPathComponent]];
                        
                        [self copyFile:file to:outPath];
                    }
                    [sLock unlock];
                    
                    files = [self listFiles:workingDir];
                    
                    for (NSString *file in files) {
                        NSTimeInterval start = now();
                        NSError *error;
                        NSString *text = [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:&error];
                        NSUInteger size = [text lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
                        
                        if (error) {
                            if ([self getLoggerLogsAllowed]) OULogError(TAG, error);
                        } else {
                            NSDictionary *dict = @{@"device" : [self device],
                                                   @"text" : text};
                            
                            NSData *json = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
                            
                            if (error) {
                                if ([self getLoggerLogsAllowed]) OULogError(TAG, error);
                                error = nil;
                            } else {
                                [self makeRequest:base body:json response:^(NSInteger statusCode, NSDictionary *dict, NSError *error) {
                                    NSTimeInterval delta = now() - start;
                                    NSString *original = [[self directory] stringByAppendingPathComponent:[file lastPathComponent]];
                                    
                                    if (statusCode == 201) {
                                        [self removeFile:original];
                                    } else if (statusCode == 404) {
                                        if ([self getLoggerLogsAllowed])
                                            OULogWarn(TAG, @"Invalid channel key.", @{@"time" : OUDouble(delta, 3),
                                                                                      @"status" : @(statusCode)});
                                        
                                        [self removeFile:original];
                                    } else {
                                        if (error) {
                                            if ([self getLoggerLogsAllowed])
                                                OULogError(TAG, @"Could not upload logs.", @{@"time" : OUDouble(delta, 3),
                                                                                             @"error" : error.description,
                                                                                             @"status" : @(statusCode),
                                                                                             @"size" : @(size)});
                                        } else {
                                            if ([self getLoggerLogsAllowed])
                                                OULogError(TAG, @"Could not upload logs.", @{@"time" : OUDouble(delta, 3),
                                                                                             @"error" : dict[@"error"],
                                                                                             @"status" : @(statusCode),
                                                                                             @"size" : @(size)});
                                        }
                                    }
                                    
                                    [self removeFile:file];
                                }];
                            }
                        }
                    }
                } else {
                    if ([self getLoggerLogsAllowed]) OULogWarn(TAG, @"Could not upload logs. Not connected to internet.");
                }
                
                if ([self getDisableTimedOperations] && ![self getLiveTail]) return;
                
                NSTimeInterval nextDispatch;
                
                if ([self getLiveTail]) {
                    nextDispatch = [self nextDispatch:[sSettings[SETTING_UPLOAD_INTERVAL_LIVE_TAIL] doubleValue]];
                } else {
                    if ([self isWifi]) {
                        nextDispatch = [self nextDispatch:[sSettings[SETTING_UPLOAD_INTERVAL_WIFI] doubleValue]];
                    } else {
                        nextDispatch = [self nextDispatch:[sSettings[SETTING_UPLOAD_INTERVAL_WWAN] doubleValue]];
                    }
                }
                
                if (sUploadTimer) [sUploadTimer invalidate];
                
                sUploadTimer = [NSTimer timerWithTimeInterval:nextDispatch
                                                       target:self
                                                     selector:@selector(dispatchTimer:)
                                                     userInfo:sUploadBlock
                                                      repeats:NO];
                [[NSRunLoop mainRunLoop] addTimer:sUploadTimer forMode:NSRunLoopCommonModes];
            };
            
            sQueueBlock = ^{
                NSMutableArray *logs = [NSMutableArray new];
                
                [sLock lock];
                [logs addObjectsFromArray:sQueue];
                [sQueue removeAllObjects];
                [sLock unlock];
                
                for (OULogInternal *log in logs) {
                    [self processLog:log.location thread:log.thread time:log.time level:log.level tag:log.tag message:log.message];
                }
                
                [sLock lock];
                if (sQueue.count > 0) {
                    [self dispatchBlock:sQueueBlock];
                }
                [sLock unlock];
            };
        }
    }
}

#pragma mark - Init

+ (void)initWithKey:(NSString *)key {
    [sLock lock];
    
    if (sInitialized) {
        OULogWarn(TAG, @"Ouralabs already initialized");
        [sLock unlock];
    } else if (!key || key.length == 0) {
        OULogError(TAG, @"Cannot init with null or empty channel key");
        [sLock unlock];
    } else {
        sInitialized = YES;
        sChannelKey = key;
        sAppIdentifier = [self appIdentifier];
        sSettings = [self defaultSettings];
        sNameID = [self sha256:[[UIDevice currentDevice] name]];
        
        [self loadSettings];
        [self updateFiles];
        
        if ([self getLoggerLogsAllowed]) OULogInfo(TAG, @"Initialized Ouralabs");
        
        if (simulator()) {
            sLogLevel = @(OULogLevelTrace);
            sLiveTail = @(NO);
            
            OULogWarn(TAG, @"Simulator is not supported");
        } else {
            [self dispatchBlock:sSettingsBlock];
            [self dispatchBlock:sQueueBlock];
            [self dispatchBlock:sUploadBlock];
        }
        
        [sLock unlock];
    }
}

#pragma mark - Public API

+ (void)setLiveTail:(NSNumber *)liveTail {
    [sLock lock];
    sLiveTail = liveTail;
    [sLock unlock];
}

+ (void)setAppVersion:(NSString *)appVersion {
    [sLock lock];
    sAppVersion = appVersion;
    [sLock unlock];
}

+ (void)setLogLevel:(NSNumber *)logLevel {
    [sLock lock];
    sLogLevel = logLevel;
    
    if (sLogLevel) {
        NSInteger intValue = [sLogLevel integerValue];
        sLogLevel = @(MIN(OULogLevelFatal, MAX(OULogLevelTrace, intValue)));
    }
    
    [sLock unlock];
}

+ (void)setAttributes:(NSDictionary *)attributes {
    [sLock lock];
    if (!sAttributes) sAttributes = [NSMutableDictionary new];
    if (!attributes) attributes = [NSMutableDictionary new];
    
    NSString *attr1 = sAttributes[OUAttr1] ? sAttributes[OUAttr1] : @"";
    NSString *attr2 = sAttributes[OUAttr2] ? sAttributes[OUAttr2] : @"";
    NSString *attr3 = sAttributes[OUAttr3] ? sAttributes[OUAttr3] : @"";
    
    BOOL changed;
    
    changed = ![attr1 isEqualToString:attributes[OUAttr1]];
    changed = changed || ![attr2 isEqualToString:attributes[OUAttr2]];
    changed = changed || ![attr3 isEqualToString:attributes[OUAttr3]];
    
    sAttributes = [NSMutableDictionary dictionaryWithDictionary:attributes];
    
    if (changed) {
        [sSettingsTimer invalidate];
        [self dispatchBlock:sSettingsBlock];
    }
    
    [sLock unlock];
}

+ (void)setOptIn:(BOOL)optIn {
    [sLock lock];
    sSettings[_SETTING_OPT_IN] = @(optIn);
    [self saveSettings];
    [sLock unlock];
}

+ (void)setDiskOnly:(NSNumber *)diskOnly {
    [sLock lock];
    sDiskOnly = diskOnly;
    [sLock unlock];
}

+ (void)setBuffered:(NSNumber *)buffered {
    [sLock lock];
    sBuffered = buffered;
    [sLock unlock];
}

+ (void)setLocation:(CLLocation *)location {
    [sLock lock];
    sLocation = location;
    [sLock unlock];
}

+ (void)setDisableTimedOperations:(BOOL)disable {
    [sLock lock];
    sDisableTimedOperations = disable;
    [sLock unlock];
}

+ (void)setLoggerLogsAllowed:(NSNumber *)allowed {
    [sLock lock];
    sLoggerLogsAllowed = allowed;
    [sLock unlock];
}

+ (BOOL)getInitialized {
    [sLock lock];
    BOOL val = sInitialized;
    [sLock unlock];
    return val;
}

+ (BOOL)getLiveTail {
    [sLock lock];
    BOOL val;
    if (sLiveTail) {
        val = [sLiveTail boolValue];
    } else {
        val = [sSettings[SETTING_LIVE_TAIL] boolValue];
    }
    [sLock unlock];
    return val;
}

+ (OULogLevel)getLogLevel {
    [sLock lock];
    OULogLevel val;
    if (sLogLevel) {
        val = [sLogLevel integerValue];
    } else {
        val = [sSettings[SETTING_LOG_LEVEL] integerValue];
    }
    [sLock unlock];
    return val;
}

+ (BOOL)getOptIn {
    [sLock lock];
    BOOL val;
    if (sSettings[_SETTING_OPT_IN]) {
        val = [sSettings[_SETTING_OPT_IN] boolValue];
    } else {
        val = YES;
    }
    [sLock unlock];
    return val;
}

+ (BOOL)getDiskOnly {
    [sLock lock];
    BOOL val;
    if (sDiskOnly) {
        val = [sDiskOnly boolValue];
    } else {
        val = sSettings[SETTING_DISK_ONLY] ? [sSettings[SETTING_DISK_ONLY] boolValue] : YES;
    }
    [sLock unlock];
    return val;
}

+ (BOOL)getBuffered {
    [sLock lock];
    BOOL val;
    if (sBuffered) {
        val = [sBuffered boolValue];
    } else {
        val = sSettings[SETTING_BUFFERED] ? [sSettings[SETTING_BUFFERED] boolValue] : NO;
    }
    [sLock unlock];
    return val;
}

+ (NSString *)getAppVersion {
    [sLock lock];
    NSString *val;
    
    if (sAppVersion) {
        val = sAppVersion;
    } else {
        val = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    }
    [sLock unlock];
    return val;
}

+ (NSString *)getVersion {
    return VERSION;
}

+ (NSDictionary *)getAttributes {
    [sLock lock];
    NSMutableDictionary *attrs = [NSMutableDictionary new];
    
    if (sAttributes) {
        [attrs addEntriesFromDictionary:sAttributes];
    }
    
    [sLock unlock];
    return attrs;
}

+ (CLLocation *)getLocation {
    [sLock lock];
    CLLocation *val = sLocation;
    [sLock unlock];
    return val;
}

+ (BOOL)getDisableTimedOperations {
    [sLock lock];
    BOOL val = sDisableTimedOperations;
    [sLock unlock];
    return val;
}

+ (BOOL)getLoggerLogsAllowed {
    [sLock lock];
    BOOL val;
    if (sLoggerLogsAllowed) {
        val = [sLoggerLogsAllowed boolValue];
    } else {
        val = sSettings[SETTING_LOGGER_LOGS_ALLOWED] ? [sSettings[SETTING_LOGGER_LOGS_ALLOWED] boolValue] : NO;
    }
    [sLock unlock];
    return val;
}

+ (void)update {
    [sLock lock];
    if (sInitialized) {
        if ([self getLoggerLogsAllowed]) OULogDebug(TAG, @"Forcing update");
        
        [sSettingsTimer invalidate];
        [sUploadTimer invalidate];
        
        [self dispatchBlock:sSettingsBlock];
        [self dispatchBlock:sUploadBlock];
    } else {
        if ([self getLoggerLogsAllowed]) OULogWarn(TAG, @"Attempted to update without initializing");
    }
    [sLock unlock];
}

+ (void)flush {
    [sLock lock];
    if (sInitialized) {
        if ([self getLoggerLogsAllowed]) OULogDebug(TAG, @"Forcing flush");
        
        [sUploadTimer invalidate];
        [self dispatchBlock:sUploadBlock];
    } else {
        if ([self getLoggerLogsAllowed]) OULogWarn(TAG, @"Attempted to flush without initializing");
    }
    [sLock unlock];
}

+ (void)t:(NSString *)tag message:(NSString *)message, ... {
    if (![self shouldLog:@(OULogLevelTrace)]) return;
    
    va_list args;
    va_start(args, message);
    [self t:tag message:message args:args];
    va_end(args);
}

+ (void)t:(NSString *)tag message:(NSString *)message args:(va_list)args {
    if (![self shouldLog:@(OULogLevelTrace)]) return;
    
    [self logInternal:@(OULogLevelTrace) tag:tag message:[[NSString alloc] initWithFormat:(message ? message : @"") arguments:args]];
}

+ (void)t:(NSString *)tag exception:(NSException *)exception {
    if (![self shouldLog:@(OULogLevelTrace)]) return;
    
    [self t:tag message:[NSString stringWithFormat:@"%@", exception]];
}

+ (void)t:(NSString *)tag error:(NSError *)error {
    if (![self shouldLog:@(OULogLevelTrace)]) return;
    
    [self t:tag message:(error ? error.description : @"(null)")];
}

+ (void)t:(NSString *)tag message:(NSString *)message kvp:(NSDictionary *)kvp {
    if (![self shouldLog:@(OULogLevelTrace)]) return;
    
    [self t:tag message:[NSString stringWithFormat:@"%@ %@", (message ? message : @""), (kvp ? [self kvpToString:kvp] : @"")]];
}

+ (void)t:(NSString *)tag message:(NSString *)message exception:(NSException *)exception {
    if (![self shouldLog:@(OULogLevelTrace)]) return;
    
    [self t:tag message:[NSString stringWithFormat:@"%@\n%@", (message ? message : @""), (exception ? exception.description : @"(null)")]];
}

+ (void)t:(NSString *)tag message:(NSString *)message error:(NSError *)error {
    if (![self shouldLog:@(OULogLevelTrace)]) return;
    
    [self t:tag message:[NSString stringWithFormat:@"%@\n%@", (message ? message : @""), (error ? error.description : @"(null)")]];
}

+ (void)d:(NSString *)tag message:(NSString *)message, ... {
    if (![self shouldLog:@(OULogLevelDebug)]) return;
    
    va_list args;
    va_start(args, message);
    [self d:tag message:message args:args];
    va_end(args);
}

+ (void)d:(NSString *)tag message:(NSString *)message args:(va_list)args {
    if (![self shouldLog:@(OULogLevelDebug)]) return;
    
    [self logInternal:@(OULogLevelDebug) tag:tag message:[[NSString alloc] initWithFormat:(message ? message : @"") arguments:args]];
}

+ (void)d:(NSString *)tag exception:(NSException *)exception {
    if (![self shouldLog:@(OULogLevelDebug)]) return;
    
    [self d:tag message:[NSString stringWithFormat:@"%@", exception]];
}

+ (void)d:(NSString *)tag error:(NSError *)error {
    if (![self shouldLog:@(OULogLevelDebug)]) return;
    
    [self d:tag message:(error ? error.description : @"(null)")];
}

+ (void)d:(NSString *)tag message:(NSString *)message kvp:(NSDictionary *)kvp {
    if (![self shouldLog:@(OULogLevelDebug)]) return;
    
    [self d:tag message:[NSString stringWithFormat:@"%@ %@", (message ? message : @""), (kvp ? [self kvpToString:kvp] : @"")]];
}

+ (void)d:(NSString *)tag message:(NSString *)message exception:(NSException *)exception {
    if (![self shouldLog:@(OULogLevelDebug)]) return;
    
    [self d:tag message:[NSString stringWithFormat:@"%@\n%@", (message ? message : @""), (exception ? exception.description : @"(null)")]];
}

+ (void)d:(NSString *)tag message:(NSString *)message error:(NSError *)error {
    if (![self shouldLog:@(OULogLevelDebug)]) return;
    
    [self d:tag message:[NSString stringWithFormat:@"%@\n%@", (message ? message : @""), (error ? error.description : @"(null)")]];
}

+ (void)i:(NSString *)tag message:(NSString *)message, ... {
    if (![self shouldLog:@(OULogLevelInfo)]) return;
    
    va_list args;
    va_start(args, message);
    [self i:tag message:message args:args];
    va_end(args);
}

+ (void)i:(NSString *)tag message:(NSString *)message args:(va_list)args {
    if (![self shouldLog:@(OULogLevelInfo)]) return;
    
    [self logInternal:@(OULogLevelInfo) tag:tag message:[[NSString alloc] initWithFormat:(message ? message : @"") arguments:args]];
}

+ (void)i:(NSString *)tag exception:(NSException *)exception {
    if (![self shouldLog:@(OULogLevelInfo)]) return;
    
    [self i:tag message:[NSString stringWithFormat:@"%@", exception]];
}

+ (void)i:(NSString *)tag error:(NSError *)error {
    if (![self shouldLog:@(OULogLevelInfo)]) return;
    
    [self i:tag message:(error ? error.description : @"(null)")];
}

+ (void)i:(NSString *)tag message:(NSString *)message kvp:(NSDictionary *)kvp {
    if (![self shouldLog:@(OULogLevelInfo)]) return;
    
    [self i:tag message:[NSString stringWithFormat:@"%@ %@", (message ? message : @""), (kvp ? [self kvpToString:kvp] : @"")]];
}

+ (void)i:(NSString *)tag message:(NSString *)message exception:(NSException *)exception {
    if (![self shouldLog:@(OULogLevelInfo)]) return;
    
    [self i:tag message:[NSString stringWithFormat:@"%@\n%@", (message ? message : @""), (exception ? exception.description : @"(null)")]];
}

+ (void)i:(NSString *)tag message:(NSString *)message error:(NSError *)error {
    if (![self shouldLog:@(OULogLevelInfo)]) return;
    
    [self i:tag message:[NSString stringWithFormat:@"%@\n%@", (message ? message : @""), (error ? error.description : @"(null)")]];
}

+ (void)w:(NSString *)tag message:(NSString *)message, ... {
    if (![self shouldLog:@(OULogLevelWarn)]) return;
    
    va_list args;
    va_start(args, message);
    [self w:tag message:message args:args];
    va_end(args);
}

+ (void)w:(NSString *)tag message:(NSString *)message args:(va_list)args {
    if (![self shouldLog:@(OULogLevelWarn)]) return;
    
    [self logInternal:@(OULogLevelWarn) tag:tag message:[[NSString alloc] initWithFormat:(message ? message : @"") arguments:args]];
}

+ (void)w:(NSString *)tag exception:(NSException *)exception {
    if (![self shouldLog:@(OULogLevelWarn)]) return;
    
    [self w:tag message:[NSString stringWithFormat:@"%@", exception]];
}

+ (void)w:(NSString *)tag error:(NSError *)error {
    if (![self shouldLog:@(OULogLevelWarn)]) return;
    
    [self w:tag message:(error ? error.description : @"(null)")];
}

+ (void)w:(NSString *)tag message:(NSString *)message kvp:(NSDictionary *)kvp {
    if (![self shouldLog:@(OULogLevelWarn)]) return;
    
    [self w:tag message:[NSString stringWithFormat:@"%@ %@", (message ? message : @""), (kvp ? [self kvpToString:kvp] : @"")]];
}

+ (void)w:(NSString *)tag message:(NSString *)message exception:(NSException *)exception {
    if (![self shouldLog:@(OULogLevelWarn)]) return;
    
    [self w:tag message:[NSString stringWithFormat:@"%@\n%@", (message ? message : @""), (exception ? exception.description : @"(null)")]];
}

+ (void)w:(NSString *)tag message:(NSString *)message error:(NSError *)error {
    if (![self shouldLog:@(OULogLevelWarn)]) return;
    
    [self w:tag message:[NSString stringWithFormat:@"%@\n%@", (message ? message : @""), (error ? error.description : @"(null)")]];
}

+ (void)e:(NSString *)tag message:(NSString *)message, ... {
    if (![self shouldLog:@(OULogLevelError)]) return;
    
    va_list args;
    va_start(args, message);
    [self e:tag message:message args:args];
    va_end(args);
}

+ (void)e:(NSString *)tag message:(NSString *)message args:(va_list)args {
    if (![self shouldLog:@(OULogLevelError)]) return;
    
    [self logInternal:@(OULogLevelError) tag:tag message:[[NSString alloc] initWithFormat:(message ? message : @"") arguments:args]];
}

+ (void)e:(NSString *)tag exception:(NSException *)exception {
    if (![self shouldLog:@(OULogLevelError)]) return;
    
    [self e:tag message:[NSString stringWithFormat:@"%@", exception]];
}

+ (void)e:(NSString *)tag error:(NSError *)error {
    if (![self shouldLog:@(OULogLevelError)]) return;
    
    [self e:tag message:(error ? error.description : @"(null)")];
}

+ (void)e:(NSString *)tag message:(NSString *)message kvp:(NSDictionary *)kvp {
    if (![self shouldLog:@(OULogLevelError)]) return;
    
    [self e:tag message:[NSString stringWithFormat:@"%@ %@", (message ? message : @""), (kvp ? [self kvpToString:kvp] : @"")]];
}

+ (void)e:(NSString *)tag message:(NSString *)message exception:(NSException *)exception {
    if (![self shouldLog:@(OULogLevelError)]) return;
    
    [self e:tag message:[NSString stringWithFormat:@"%@\n%@", (message ? message : @""), (exception ? exception.description : @"(null)")]];
}

+ (void)e:(NSString *)tag message:(NSString *)message error:(NSError *)error {
    if (![self shouldLog:@(OULogLevelError)]) return;
    
    [self e:tag message:[NSString stringWithFormat:@"%@\n%@", (message ? message : @""), (error ? error.description : @"(null)")]];
}

+ (void)f:(NSString *)tag message:(NSString *)message, ... {
    if (![self shouldLog:@(OULogLevelFatal)]) return;
    
    va_list args;
    va_start(args, message);
    [self f:tag message:message args:args];
    va_end(args);
}

+ (void)f:(NSString *)tag message:(NSString *)message args:(va_list)args {
    if (![self shouldLog:@(OULogLevelFatal)]) return;
    
    [self logInternal:@(OULogLevelFatal) tag:tag message:[[NSString alloc] initWithFormat:(message ? message : @"") arguments:args]];
}

+ (void)f:(NSString *)tag exception:(NSException *)exception {
    if (![self shouldLog:@(OULogLevelFatal)]) return;
    
    [self f:tag message:[NSString stringWithFormat:@"%@", exception]];
}

+ (void)f:(NSString *)tag error:(NSError *)error {
    if (![self shouldLog:@(OULogLevelFatal)]) return;
    
    [self f:tag message:(error ? error.description : @"(null)")];
}

+ (void)f:(NSString *)tag message:(NSString *)message kvp:(NSDictionary *)kvp {
    if (![self shouldLog:@(OULogLevelFatal)]) return;
    
    [self f:tag message:[NSString stringWithFormat:@"%@ %@", (message ? message : @""), (kvp ? [self kvpToString:kvp] : @"")]];
}

+ (void)f:(NSString *)tag message:(NSString *)message exception:(NSException *)exception {
    if (![self shouldLog:@(OULogLevelFatal)]) return;
    
    [self f:tag message:[NSString stringWithFormat:@"%@\n%@", (message ? message : @""), (exception ? exception.description : @"(null)")]];
}

+ (void)f:(NSString *)tag message:(NSString *)message error:(NSError *)error {
    if (![self shouldLog:@(OULogLevelFatal)]) return;
    
    [self f:tag message:[NSString stringWithFormat:@"%@\n%@", (message ? message : @""), (error ? error.description : @"(null)")]];
}

+ (void)log:(OULogLevel)level tag:(NSString *)tag message:(NSString *)message, ... {
    if (![self shouldLog:@(level)]) return;
    
    va_list args;
    va_start(args, message);
    [self log:level tag:tag message:message args:args];
    va_end(args);
}

+ (void)log:(OULogLevel)level tag:(NSString *)tag message:(NSString *)message args:(va_list)args {
    if (![self shouldLog:@(level)]) return;
    
    [self logInternal:@(level) tag:tag message:[[NSString alloc] initWithFormat:(message ? message : @"") arguments:args]];
}

+ (void)log:(OULogLevel)level tag:(NSString *)tag exception:(NSException *)exception {
    if (![self shouldLog:@(level)]) return;
    
    [self logInternal:@(level) tag:tag message:[NSString stringWithFormat:@"%@", exception]];
}

+ (void)log:(OULogLevel)level tag:(NSString *)tag error:(NSError *)error {
    if (![self shouldLog:@(level)]) return;
    
    [self logInternal:@(level) tag:tag message:(error ? error.description : @"(null)")];
}

+ (void)log:(OULogLevel)level tag:(NSString *)tag message:(NSString *)message exception:(NSException *)exception {
    if (![self shouldLog:@(level)]) return;
    
    [self logInternal:@(level) tag:tag message:[NSString stringWithFormat:@"%@\n%@", (message ? message : @""), exception]];
}

+ (void)log:(OULogLevel)level tag:(NSString *)tag message:(NSString *)message error:(NSError *)error {
    if (![self shouldLog:@(level)]) return;
    
    [self logInternal:@(level) tag:tag message:[NSString stringWithFormat:@"%@\n%@", (message ? message : @""), (error ? error.description : @"(null)")]];
}

+ (void)log:(OULogLevel)level tag:(NSString *)tag message:(NSString *)message kvp:(NSDictionary *)kvp {
    if (![self shouldLog:@(level)]) return;
    
    [self logInternal:@(level) tag:tag message:[NSString stringWithFormat:@"%@ %@", (message ? message : @""), (kvp ? [self kvpToString:kvp] : @"")]];
}

#pragma mark - Internals

+ (void)logInternal:(NSNumber *)level tag:(NSString *)tag message:(NSString *)message {
    [sLock lock];
    
    NSString *thread = [self threadName];
    CLLocation *location = [self getLocation];
    
    NSTimeInterval time = now();
    
    if (!sInitialized) {
        [sQueue addObject:[[OULogInternal alloc] initWithLocation:location thread:thread time:time level:level tag:tag message:message]];
    } else if ([self getBuffered]) {
        [sQueue addObject:[[OULogInternal alloc] initWithLocation:location thread:thread time:time level:level tag:tag message:message]];
        
        if (sQueue.count == 1) {
            [self dispatchBlock:sQueueBlock];
        }
    } else {
        [self processLog:location thread:thread time:time level:level tag:tag message:message];
    }
    
    [sLock unlock];
}

+ (void)processLog:(CLLocation *)location thread:(NSString *)thread time:(double)time level:(NSNumber *)level tag:(NSString *)tag message:(NSString *)message {
    [sLock lock];
    
    tag = !tag ? @"tag" : tag;
    
    NSString *log = [self fullMessage:location thread:thread time:time level:level tag:tag message:message];
    
    if (![self getDiskOnly]) {
        NSLog(@"%@ [%@] %@ %@", thread, tag, [self level:level], message);
    }
    
    if (!simulator()) {
        if (sFileHandle) {
            [sFileHandle seekToEndOfFile];
            
            NSString *encrypted = [self encrypt:log];
            if (encrypted) {
                [sFileHandle writeData:[encrypted dataUsingEncoding:NSUTF8StringEncoding]];
            }
            
            if ([[sFileManager attributesOfItemAtPath:sFile error:nil] fileSize] >= [sSettings[SETTING_MAX_FILE_SIZE] integerValue]) [self rollFile];
        }
    }
    
    [sLock unlock];
}

+ (BOOL)shouldLog:(NSNumber *)requestLevel {
    [sLock lock];
    BOOL val;
    if (!sInitialized) {
        val = NO;
    } else if (![self getOptIn]) {
        val = NO;
    } else {
        if (sLogLevel) {
            val = [requestLevel integerValue] >= [sLogLevel integerValue];
        } else {
            val = [requestLevel integerValue] >= [sSettings[SETTING_LOG_LEVEL] integerValue];
        }
    }
    [sLock unlock];
    return val;
}

+ (NSString *)fullMessage:(CLLocation *)location thread:(NSString *)thread time:(double)time level:(NSNumber *)level tag:(NSString *)tag message:(NSString *)message {
    NSMutableString *str = [NSMutableString new];
    [str appendString:[self getAppVersion]];
    [str appendString:@" "];
    [str appendFormat:@"%.6f", location ? location.coordinate.latitude : 0.0];
    [str appendString:@","];
    [str appendFormat:@"%.6f", location ? location.coordinate.longitude : 0.0];
    [str appendString:@" "];
    [str appendFormat:@"%.3f", time];
    [str appendString:@" - "];
    [str appendString:thread];
    [str appendString:@" ["];
    [str appendString:tag];
    [str appendString:@"] "];
    [str appendString:[self level:level]];
    [str appendString:@" "];
    [str appendString:message];
    [str appendString:@"\n"];
    return str;
}

+ (NSString *)level:(NSNumber *)level {
    switch ([level integerValue]) {
        case OULogLevelTrace :
        return @"TRACE";
        case OULogLevelDebug :
        return @"DEBUG";
        case OULogLevelInfo :
        return @"INFO";
        case OULogLevelWarn :
        return @"WARN";
        case OULogLevelError :
        return @"ERROR";
        case OULogLevelFatal :
        return @"FATAL";
        default :
        return @"";
    }
}

+ (NSString *)rootDirectory {
    NSString *directory = [sLibraryFile stringByAppendingPathComponent:@"ouralabs"];
    [self createDirectory:directory];
    return directory;
}

+ (NSString *)directory {
    NSString *directory = [[self rootDirectory] stringByAppendingPathComponent:sChannelKey];
    [self createDirectory:directory];
    
    return directory;
}

+ (NSString *)workingDirectory {
    NSString *directory = [[self directory] stringByAppendingPathComponent:@"working"];
    [self createDirectory:directory];
    return directory;
}

+ (NSString *)file {
    NSString *file = [[self directory] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.txt", sChannelKey]];
    
    if (![sFileManager fileExistsAtPath:file isDirectory:nil]) {
        [sFileManager createFileAtPath:file contents:nil attributes:nil];
    }
    
    return file;
}

+ (NSString *)rolledFile:(NSString *)file {
    NSString *parent = [file stringByDeletingLastPathComponent];
    
    NSString *extension = [file pathExtension];
    NSString *name = [[file lastPathComponent] stringByDeletingPathExtension];
    
    NSString *newName = [NSString stringWithFormat:@"%@.%lld.%@", name, (long long)(now() * 1000), extension];
    NSString *toFile = [parent stringByAppendingPathComponent:newName];
    
    return toFile;
}

+ (void)rollFile {
    NSString *rollTo = [self rolledFile:sFile];
    
    [self copyFile:sFile to:rollTo];
    [self removeFile:sFile];
    [self updateFiles];
    
    NSInteger total = 0, delCount = 0;
    
    for (NSInteger i = sFiles.count - 1; i >= 0; i--) {
        NSString *path = sFiles[i];
        
        total += [[sFileManager attributesOfItemAtPath:path error:nil] fileSize];
        
        if (total > [sSettings[SETTING_MAX_SIZE] integerValue]) {
            delCount++;
        }
    }
    
    for (NSInteger i = 0; i < delCount; i++) {
        NSString *path = sFiles[i];
        
        [self removeFile:path];
        [sFiles removeObject:path];
    }
}

+ (void)clearDir:(NSString *)file {
    BOOL isDir;
    
    [sFileManager fileExistsAtPath:file isDirectory:&isDir];
    
    if (isDir) {
        NSDirectoryEnumerator *enumerator = [sFileManager enumeratorAtPath:file];
        
        NSString *fname;
        while (fname = [enumerator nextObject]) {
            BOOL isChildDir;
            [sFileManager fileExistsAtPath:fname isDirectory:&isChildDir];
            
            if (isChildDir) {
                [self clearDir:fname];
            } else {
                NSError *error;
                [sFileManager removeItemAtPath:fname error:&error];
                
                if (error && [self getLoggerLogsAllowed]) OULogError(TAG, error);
            }
        }
    }
}

+ (void)loadSettings {
    [sLock lock];
    NSMutableDictionary *dict;
    NSString *file = [[self directory] stringByAppendingPathComponent:@"settings.json"];
    
    if ([sFileManager fileExistsAtPath:file isDirectory:nil]) {
        dict = [NSMutableDictionary dictionaryWithContentsOfFile:file];
    }
    
    for (NSString *key in [dict allKeys]) {
        id val = dict[key];
        
        if ([key hasPrefix:@"_attr"]) continue;
        
        sSettings[key] = val;
    }
    
    if (!sAttributes) sAttributes = [NSMutableDictionary new];
    
    if (sSettings[_SETTING_ATTR_1]) sAttributes[OUAttr1] = sSettings[_SETTING_ATTR_1];
    if (sSettings[_SETTING_ATTR_2]) sAttributes[OUAttr2] = sSettings[_SETTING_ATTR_2];
    if (sSettings[_SETTING_ATTR_3]) sAttributes[OUAttr3] = sSettings[_SETTING_ATTR_3];
    
    [self loadPublicKey];
    [sLock unlock];
}

+ (void)saveSettings {
    [sLock lock];
    if (sAttributes) {
        if (sAttributes[OUAttr1]) sSettings[_SETTING_ATTR_1] = sAttributes[OUAttr1];
        if (sAttributes[OUAttr2]) sSettings[_SETTING_ATTR_2] = sAttributes[OUAttr2];
        if (sAttributes[OUAttr3]) sSettings[_SETTING_ATTR_3] = sAttributes[OUAttr3];
    }
    
    NSString *file = [[self directory] stringByAppendingPathComponent:@"settings.json"];
    [sSettings writeToFile:file atomically:YES];
    [sLock unlock];
}

+ (NSMutableDictionary *)defaultSettings {
    return [NSMutableDictionary dictionaryWithDictionary:
            @{SETTING_API_SCHEME : @"https",
              SETTING_API_HOST : @"www.ouralabs.com",
              SETTING_API_TIMEOUT : @(120),
              SETTING_LOG_LEVEL : @(OULogLevelWarn),
              SETTING_MAX_FILE_SIZE : @(1024 * 1024),
              SETTING_MAX_SIZE : @(1024 * 1024 * 20),
              SETTING_DISK_ONLY : @(YES),
              SETTING_BUFFERED : @(NO),
              SETTING_UPLOAD_INTERVAL_LIVE_TAIL : @(5),
              SETTING_UPLOAD_INTERVAL_WIFI : @(60 * 5),
              SETTING_UPLOAD_INTERVAL_WWAN : @(60 * 60),
              SETTING_EXPIRATION : @(60 * 60),
              SETTING_LIVE_TAIL : @(NO),
              SETTING_CERTIFICATE : @"",
              SETTING_LOGGER_LOGS_ALLOWED : @(NO)}];
}

+ (NSDictionary *)device {
    UIDevice *device = [UIDevice currentDevice];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:@{@"platform" : @"ios",
                                                                                @"platform_version" : [device systemVersion],
                                                                                @"manufacturer" : @"apple",
                                                                                @"model" : [self model],
                                                                                @"name_id" : sNameID,
                                                                                @"vendor_id" : [[device identifierForVendor] UUIDString],
                                                                                @"device_key" : [self createDeviceKey],
                                                                                @"app_identifier" : [self appIdentifier],
                                                                                @"app_version" : [self appVersion],
                                                                                @"opt_in" : @([self getOptIn]),
                                                                                @"live_tail" : sLiveTail ? sLiveTail : [NSNull null],
                                                                                @"log_level" : sLogLevel ? sLogLevel : [NSNull null]}];
    
    if (sAttributes) {
        if (sAttributes[OUAttr1]) dict[OUAttr1] = sAttributes[OUAttr1];
        if (sAttributes[OUAttr2]) dict[OUAttr2] = sAttributes[OUAttr2];
        if (sAttributes[OUAttr3]) dict[OUAttr3] = sAttributes[OUAttr3];
    }
    
    return dict;
}

+ (BOOL)isWifi {
    if ([self isConnected]) return NO;
    
    SCNetworkReachabilityFlags flags = 0;
    BOOL wifi = YES;
    
    if (SCNetworkReachabilityGetFlags(sReachabilityRef, &flags)) {
        wifi = !(flags & kSCNetworkReachabilityFlagsIsWWAN);
    }
    
    return wifi;
}

+ (BOOL)isConnected {
    SCNetworkReachabilityFlags flags = 0;
    BOOL connected = YES;
    
    if (!SCNetworkReachabilityGetFlags(sReachabilityRef, &flags)) {
        connected = NO;
    } else {
        if (!(flags & kSCNetworkReachabilityFlagsReachable)) {
            connected = NO;
        }
    }
    
    return connected;
}

+ (NSString *)createDeviceKey {
    NSString *vendorID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    return [self sha256:[vendorID stringByAppendingString:sNameID]];
}

+ (NSString *)sha256:(NSString *)clear {
    const char *str = [clear UTF8String];
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA256(str, (CC_LONG)strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x", result[i]];
    }
    return ret;
}

+ (NSString *)appVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+ (NSString *)appIdentifier {
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSTimeInterval)nextDispatch:(NSTimeInterval)val {
    long long interval = (long long) val * 1000;
    long long offset = [[[UIDevice currentDevice] name] hash] % interval;
    long long now = (long long) (now() * 1000);
    long long current = (now % 86400000) + offset;
    long long next = ceil(((double) current / interval) * interval) - current;
    long long nextDispatch = next == 0 ? interval : next;
    
    return nextDispatch / 1000.0;
}

+ (void)updateFiles {
    if (sFileHandle) [sFileHandle closeFile];
    
    sFile = [self file];
    
    [sFiles removeAllObjects];
    
    NSError *error;
    NSString *directory = [self directory];
    NSArray *files = [sFileManager contentsOfDirectoryAtPath:directory error:&error];
    NSMutableArray *paths = [NSMutableArray new];
    
    for (NSString *path in files) {
        [paths addObject:[directory stringByAppendingPathComponent:path]];
    }
    
    if (error) {
        if ([self getLoggerLogsAllowed]) OULogError(TAG, error);
    } else {
        sFiles = [self sort:[self filter:paths]];
    }
    
    sFileHandle = [NSFileHandle fileHandleForWritingAtPath:sFile];
}

+ (NSMutableArray *)filter:(NSMutableArray *)array {
    NSMutableArray *removeList = [NSMutableArray new];
    
    for (NSString *path in array) {
        NSString *filename = [path lastPathComponent];
        
        if ([@"settings.json" isEqualToString:filename]) {
            [removeList addObject:path];
        } else if ([[[self workingDirectory] lastPathComponent] isEqualToString:filename]) {
            [removeList addObject:path];
        } else if ([[sFile lastPathComponent] isEqualToString:filename]) {
            [removeList addObject:path];
        }
    }
    
    [array removeObjectsInArray:removeList];
    return array;
}

+ (NSMutableArray *)sort:(NSMutableArray *)array {
    NSMutableArray *sortedArray = [NSMutableArray arrayWithArray:[array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *path1 = (NSString *) obj1;
        NSString *path2 = (NSString *) obj2;
        
        return [path1 compare:path2];
    }]];
    
    return sortedArray;
}

+ (NSString *)appendQueryParams:(NSString *)base dict:(NSDictionary *)params {
    for (NSString *key in [params allKeys]) {
        id val = params[key];
        NSString *value;
        
        if ([val isKindOfClass:[NSString class]]) {
            value = (NSString *)val;
        } else if ([val isKindOfClass:[NSNull class]]) {
            value = @"null";
        } else {
            value = [val stringValue];
        }
        
        base = [base stringByAppendingString:[NSString stringWithFormat:@"%@=%@&", key, [self urlEncode:value]]];
    }
    
    return base;
}

+ (NSString *)urlEncode:(NSString *)str {
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (__bridge CFStringRef) str, NULL, CFSTR("!*'();:@&=+$,/?%#[]\" "), kCFStringEncodingUTF8));
}

+ (BOOL)removeFile:(NSString *)file {
    if (![sFileManager fileExistsAtPath:file]) return YES;
    
    NSError *error;
    [sFileManager removeItemAtPath:file error:&error];
    
    if (error) {
        if ([self getLoggerLogsAllowed]) OULogError(TAG, error);
        return NO;
    } else {
        return YES;
    }
}

+ (BOOL)copyFile:(NSString *)original to:(NSString *)toPath {
    NSError *error;
    [self removeFile:toPath];
    [sFileManager copyItemAtPath:original toPath:toPath error:&error];
    
    if (error) {
        if ([self getLoggerLogsAllowed]) OULogError(TAG, error);
        return NO;
    } else {
        return YES;
    }
}

+ (void)createDirectory:(NSString *)directory {
    if (![sFileManager fileExistsAtPath:directory isDirectory:nil]) {
        NSError *error;
        
        [sFileManager createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:&error];
        
        if (error && [self getLoggerLogsAllowed]) OULogError(TAG, error);
    }
}

+ (NSMutableArray *)listFiles:(NSString *)dirPath {
    NSMutableArray *arr = [NSMutableArray new];
    NSError *error;
    
    NSArray *files = [sFileManager contentsOfDirectoryAtPath:dirPath error:&error];
    
    if (error) {
        if ([self getLoggerLogsAllowed]) OULogError(TAG, error);
    } else {
        for (NSString *file in files) {
            [arr addObject:[dirPath stringByAppendingPathComponent:file]];
        }
    }
    
    return arr;
}

+ (void)makeRequest:(NSString *)path body:(NSData *)body response:(OUResponse)responseBlock {
    path = [self appendQueryParams:path dict:@{@"version" : VERSION}];
    
    NSString *uri = [NSString stringWithFormat:@"%@://%@/%@", sSettings[SETTING_API_SCHEME], sSettings[SETTING_API_HOST], path];
    NSURL *url = [NSURL URLWithString:uri];
    NSMutableURLRequest *request  = [[NSMutableURLRequest alloc] initWithURL:url
                                                                 cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                             timeoutInterval:[sSettings[SETTING_API_TIMEOUT] doubleValue]];
    NSString *method = body ? @"POST" : @"GET";
    NSError *error;
    NSHTTPURLResponse *response;
    
    request.HTTPMethod = method;
    
    if ([@"POST" isEqualToString:method]) {
        body = [self compress:body];
        [request setValue:@"gzip/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
        [request setValue:[@(body.length) stringValue] forHTTPHeaderField:@"Content-Length"];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:body];
    }
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request
                                                 returningResponse:&response
                                                             error:&error];
    
    
    if (!responseData) {
        if (responseBlock) responseBlock(-1, nil, error);
    } else {
        NSError *error;
        NSInteger statusCode = ((NSHTTPURLResponse *)response).statusCode;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseData
                                                             options:0
                                                               error:&error];
        
        if (responseBlock) responseBlock(statusCode, dict, error);
    }
}

+ (void)dispatchTimer:(NSTimer *)timer {
    [self dispatchBlock:timer.userInfo];
}

+ (void)dispatchBlock:(dispatch_block_t)block {
    for (NSBlockOperation *op in sOperationQueue.operations) {
        dispatch_block_t opBlock = op.executionBlocks[0];
        
        if (block == opBlock && !op.executing) [op cancel];
    }
    
    [sOperationQueue addOperation:[NSBlockOperation blockOperationWithBlock:block]];
}

+ (void)loadPublicKey {
    NSString *certificate = sSettings[SETTING_CERTIFICATE];
    
    if (certificate && certificate.length > 0) {
        NSData *data = [[NSData alloc] initWithBase64EncodedString:certificate options:0];
        SecCertificateRef certificate = SecCertificateCreateWithData(kCFAllocatorDefault, ( __bridge CFDataRef)data);
        
        if (!certificate) {
            if ([self getLoggerLogsAllowed]) OULogError(TAG, @"Invalid certificate.");
            return;
        }
        
        SecPolicyRef policy = SecPolicyCreateBasicX509();
        SecTrustRef trust;
        
        if (SecTrustCreateWithCertificates(certificate, policy, &trust) != 0) {
            if ([self getLoggerLogsAllowed]) OULogError(TAG, @"Invalid trust.");
            return;
        }
        
        sPublicKey = SecTrustCopyPublicKey(trust);
    }
}

+ (NSString *)encrypt:(NSString *)input {
    if (!input || input.length == 0 || sPublicKey == nil) return nil;
    
    size_t dataSize = [input lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    uint8_t *dataInput = (uint8_t *)[[input dataUsingEncoding:NSUTF8StringEncoding] bytes];
    size_t cipherBufferSize = SecKeyGetBlockSize(sPublicKey);
    size_t blockSize = cipherBufferSize - 11;
    uint8_t *cipherBuffer = malloc(cipherBufferSize);
    NSMutableData *data = [NSMutableData new];
    
    for (NSInteger i = 0; i * blockSize < dataSize; i++) {
        uint8_t *dataToEncrypt = (dataInput + (i * blockSize));
        const size_t subsize = (((i + 1) * blockSize) > dataSize) ? blockSize - (((i + 1) * blockSize) - dataSize) : blockSize;
        
        SecKeyEncrypt(sPublicKey, kSecPaddingPKCS1, dataToEncrypt, subsize, cipherBuffer, &cipherBufferSize);
        [data appendBytes:cipherBuffer length:cipherBufferSize];
    }
    
    free(cipherBuffer);
    
    return [NSString stringWithFormat:@"%@\n", [data base64EncodedStringWithOptions:0]];
}

+ (NSString *)model {
    struct utsname systemInfo;
    uname(&systemInfo);
    
    return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
}

+ (NSString *)threadName {
    NSString *queue = [NSString stringWithCString:dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL) encoding:NSUTF8StringEncoding];
    if (queue && queue.length > 0) {
        queue = [queue componentsSeparatedByString:@"::"].firstObject;
        
        if (queue && queue.length > 0) queue = [queue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if (queue && queue.length > 0) queue = [queue stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    } else {
        queue = @"";
    }
    
    if (!queue) queue = @"";
        
    return [NSString stringWithFormat:@"%u:%@", (uint)pthread_self(), queue];
}

+ (NSString *)kvpToString:(NSDictionary *)dict {
    NSMutableString *mString = [NSMutableString new];
    
    for (NSString *key in dict.allKeys) {
        id value = dict[key];
        
        [mString appendString:[self sanitizeKVPKey:key]];
        [mString appendString:@"="];
        
        if ([value isKindOfClass:[NSString class]]) {
            [mString appendFormat:@"\"%@\"", (NSString *)value];
        } else if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[OUDouble class]]) {
            [mString appendString:[value stringValue]];
        } else {
            [mString appendString:[value description]];
        }
        
        [mString appendString:@" "];
    }
    
    return [mString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString *)sanitizeKVPKey:(NSString *)key {
    if (!key) return key;
    
    key = [key stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    key = [key stringByReplacingOccurrencesOfString:@"." withString:@"_"];
    
    if ([key hasPrefix:@"$"]) key = [key substringFromIndex:1];
    
    return key;
}

+ (NSData *)compress:(NSData *)input {
    if (!input) return input;
    
    if (input.length) {
        z_stream stream;
        stream.zalloc = Z_NULL;
        stream.zfree = Z_NULL;
        stream.opaque = Z_NULL;
        stream.avail_in = (uint) input.length;
        stream.next_in = (Bytef *)input.bytes;
        stream.total_out = 0;
        stream.avail_out = 0;
        
        if (deflateInit2(&stream, Z_DEFAULT_COMPRESSION, Z_DEFLATED, 31, 8, Z_DEFAULT_STRATEGY) == Z_OK) {
            NSMutableData *data = [NSMutableData dataWithLength:16384];
            
            while (stream.avail_out == 0) {
                if (stream.total_out >= data.length) {
                    data.length += 16384;
                }
                
                stream.next_out = [data mutableBytes] + stream.total_out;
                stream.avail_out = (uint) (data.length - stream.total_out);
                deflate(&stream, Z_FINISH);
            }
            
            deflateEnd(&stream);
            data.length = stream.total_out;
            return data;
        }
    }
    
    return nil;
}

@end