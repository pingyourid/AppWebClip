//
//  ViewController.m
//  CollectToDesktop
//
//  Created by zhangbin on 15/3/3.
//  Copyright (c) 2015年 godbe. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

- (IBAction)safariFunction:(id)sender;
- (IBAction)provision:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  利用safari功能生成webclip
 *
 *  @param sender
 */
- (IBAction)safariFunction:(id)sender {
    __weak AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //配置返回值
    [appDelegate.httpServer get:@"/old" withBlock:^(RouteRequest *request, RouteResponse *response) {
        [response setStatusCode:302]; // or 301
        [response setHeader:@"Location" value:@"data:text/html;charset=UTF-8,<html><head><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no'/><meta name='apple-mobile-web-app-capable' content='yes'/></head><body><img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAYAAAA8AXHiAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyNpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjIwQ0NGQkZERjlEMjExRTNBRjI0Rjg0NkE1MjQ1NkIyIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjIwQ0NGQkZFRjlEMjExRTNBRjI0Rjg0NkE1MjQ1NkIyIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6MjBDQ0ZCRkJGOUQyMTFFM0FGMjRGODQ2QTUyNDU2QjIiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6MjBDQ0ZCRkNGOUQyMTFFM0FGMjRGODQ2QTUyNDU2QjIiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7zvoAyAAACkklEQVR42uzcvWoUYRSA4dkQFIyQ9F5AbDSCCcReBbFMJ7Ziu9PuBdhOUgbb4BUkCGqvYmPQwmBtH2JlmvUMOxZr9ptvskFQ53ngLGQmZwnDy/6RZDAeDsdF2nJRVSczz5Tl1bj9XrSz39P9hcwd3205d7/Is9/T/UHmEetLzJ2o9vi3Wlfi9m3M9cwPZr+n+7mwakcxo5jXzdf3Yp7FrBbd2O/hfpew4NwWXAKEhbAQFggLYSEsEBbCQlggLISFsEBYCAthgbAQFsICYfEXh7UesxRT/wHiRsxOzKlLQ0enTTNTHdV/pTPrm2/F7Mdcc91o8S3mYcxh16fCj82CRy5SfsQ8mBVV7jVWvfDc9SNhN+bTvC/e91w/El5c5F3hoetHwue2k4sXuuuqmv66LB3/n47n3w0mpd4V/rJZTP6rCMxq4/28T4WPXT8SHs37Gmst5onrR8LTmBvnDav+gPQg5pLrR8LlmJcxN1Nh3Y65Ukw+jq8/lt9unjt96k5O3ciHppmpjvzjNf4Iv92AsBAWwgJhISyEBcJCWAgLhIWwEBYIC2EhLBAWwkJYICyEhbBAWAgLYYGwEBbCAmEhLIQFwkJYCAuEhbAQFggLYSEsEBbCQlggLISFsEBYCAthgbAQFsICYSEshAXCQlgIC4SFsBAWCAthISwQFsJCWCAshIWwQFgIC2GBsBAWwgJhISyEBcJCWAgLhIWwEBYIC2EhLIQFwkJYCAuEhbAQFggLYSEsEBbCQlggLISFsEBYCAthgbD4N8P6GrMVs9zMVnOsK/s93R+Mh8Nx4txRzGZRVcdTR8tyJW7fxaxm7tt+j/fbHrFGZ+60Njk26hCt/R7vt4X1puXcqw4/mP0e7/8UYACYT0iYFm82ogAAAABJRU5ErkJggg==\" alt=\"\"></body><script>if (window.navigator.standalone){window.location.href='sample://';}</script></html>"];
    }];
    
    //跳转
    UInt16 port = appDelegate.httpServer.port;
    NSLog(@"%u", port);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:%u/old", port]]];


}

/**
 *  利用profile生成webclip
 *
 *  @param sender
 */
- (IBAction)provision:(id)sender {
    //模板位置
    NSString *templatePath = [[NSBundle mainBundle] pathForResource:@"phone_template" ofType:@"mobileconfig"];
    
    //目标位置
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"profile.mobileconfig"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    }
    BOOL success = [[NSFileManager defaultManager] copyItemAtPath:templatePath toPath:path error:nil];

    __weak AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UInt16 port = appDelegate.httpServer.port;
    NSLog(@"%u", port);
    if (success) [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:%u/profile.mobileconfig", port]]];
    else NSLog(@"Error generating profile");
}
@end
