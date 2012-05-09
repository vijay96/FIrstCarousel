//
//  AppDelegate.h
//  CarouselDemo
//
//  Created by Vijay Chavan on 05/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FirstviewController;
@class SecondviewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    FirstviewController *controller;
    SecondviewController *secondcontroller;
    UITabBarController *tabbarcontroller;
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,assign)float temp;
//@property (strong,nonatomic)UITabBarController *tabbar;

@end
