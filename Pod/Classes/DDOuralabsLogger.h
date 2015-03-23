//
//  DDOuralabsLogger.h
//  Pods
//
//  Created by Ouralabs on 3/23/15.
//
//

#import <CocoaLumberjack/CocoaLumberjack.h>

@interface DDOuralabsLogger : DDAbstractLogger <DDLogger>
+ (id)sharedInstance;
@end
