//
//  AppDelegate.h
//  CollectToDesktop
//
//  Created by zhangbin on 15/3/3.
//  Copyright (c) 2015年 godbe. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "HTTPServer.h"
#import "RoutingHTTPServer.h"

UIBackgroundTaskIdentifier backgroundTask;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic, readonly) RoutingHTTPServer *httpServer;

@end

