//
//  AppInfo.m
//  AwesomeProject
//
//  Created by 李浩 on 2024/5/9.
//

#import <Foundation/Foundation.h>
#import "AppInfo.h"

@implementation AppInfo

RCT_EXPORT_MODULE(AppInfo)

+ (BOOL)requiresMainQueueSetup {
    return YES;
}

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}

- (NSDictionary *)constantsToExport {
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSMutableDictionary *settings = [[info objectForKey:@"AppSettings"] mutableCopy];
    NSString *versionName = [info objectForKey:@"CFBundleShortVersionString"];
    NSNumber *versionCode = [info objectForKey:@"CFBundleVersion"];
    NSString *bundleId = [info objectForKey:@"CFBundleIdentifier"];
    [settings setObject:versionName forKey:@"VERSION_NAME"];
    [settings setObject:versionCode forKey:@"VERSION_CODE"];
    [settings setObject:bundleId forKey:@"APPLICATION_ID"];
    return settings;
}

@end
