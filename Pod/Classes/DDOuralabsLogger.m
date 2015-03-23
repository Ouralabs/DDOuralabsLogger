//
//  DDOuralabsLogger.m
//  Pods
//
//  Created by Ouralabs on 3/23/15.
//
//

#import "DDOuralabsLogger.h"
#import <Ouralabs/Ouralabs.h>

@implementation DDOuralabsLogger

+ (id)sharedInstance {
    static DDOuralabsLogger *logger;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        logger = [DDOuralabsLogger new];
    });
    return logger;
}

- (void)logMessage:(DDLogMessage *)logMessage {
    [Ouralabs log:[self logLevel:logMessage->_flag]
              tag:logMessage->_fileName
          message:logMessage->_message];
}

- (OULogLevel)logLevel:(DDLogFlag)lvl {
    switch (lvl) {
        case DDLogFlagError :
            return OULogLevelError;
        case DDLogFlagWarning :
            return OULogLevelWarn;
        case DDLogFlagInfo :
            return OULogLevelInfo;
        case DDLogFlagDebug :
            return OULogLevelDebug;
        case DDLogFlagVerbose :
            return OULogLevelTrace;
        default :
            return OULogLevelDebug;
    }
}

@end
