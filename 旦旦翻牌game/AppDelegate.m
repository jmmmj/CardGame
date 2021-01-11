//
//  AppDelegate.m
//  旦旦翻牌game
//
//  Created by HUST on 2021/1/9.
//

#import "AppDelegate.h"
#import "JMJdandanController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController=[[JMJdandanController alloc]init];
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
