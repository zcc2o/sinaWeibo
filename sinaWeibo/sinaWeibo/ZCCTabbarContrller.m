//
//  ZCCTabbarContrller.m
//  sinaWeibo
//
//  Created by qx-005 on 16/12/7.
//  Copyright © 2016年 zcc. All rights reserved.
//

#import "ZCCTabbarContrller.h"

#import "ZCCRandomColor.h"

#define TITLEATTRIBUTES @{NSForegroundColorAttributeName : [UIColor colorWithRed:241*1.0/255 green:109*1.0/255 blue:10*1.0/255 alpha:1.0]}

@implementation ZCCTabbarContrller

- (void)viewDidLoad{
/*
    UIViewController *vc1 = [[UIViewController alloc] init];

    vc1.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    //设置tabbar
    
    vc1.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
    
    UIImage *selectedImage1 = [UIImage imageNamed:@"tabbar_home_selected"];
    //设置按下图片非自动填充
    UIImage *noRenderImage1 = [selectedImage1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc1.tabBarItem.selectedImage = noRenderImage1;
    
    vc1.tabBarItem.title = @"首页";
    
    //设置按下字体非自动填充
//    NSDictionary *titleAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:241*1.0/255 green:109*1.0/255 blue:10*1.0/255 alpha:1.0]};
    
    [vc1.tabBarItem setTitleTextAttributes:titleAttributes forState:UIControlStateSelected];
    
    [self addChildViewController:vc1];
 */
    
    
    [self settabBartxt:@"首页" andImageName:@"tabbar_home" andSelectedImageName:@"tabbar_home_selected"];
    
    [self settabBartxt:@"信息" andImageName:@"tabbar_message_center" andSelectedImageName:@"tabbar_message_center_selected"];
    
    [self settabBartxt:@"发现" andImageName:@"tabbar_discover" andSelectedImageName:@"tabbar_discover_selected"];
    
    [self settabBartxt:@"我" andImageName:@"tabbar_profile" andSelectedImageName:@"tabbar_profile_selected"];
    
    
    
}

- (void)settabBartxt:(NSString *)text andImageName:(NSString *)imageStr andSelectedImageName:(NSString *)selectedImageStr{
    
    UITableViewController *childVC = [[UITableViewController alloc] init];
    
    childVC.view.backgroundColor = ZCCRCOLOR;
    
    childVC.tabBarItem.image = [UIImage imageNamed:imageStr];
    
    UIImage *selectedImage = [UIImage imageNamed:selectedImageStr];
    
    UIImage *noRenderImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childVC.tabBarItem.selectedImage = noRenderImage;
    
    childVC.tabBarItem.title = text;
    
    [childVC.tabBarItem setTitleTextAttributes:TITLEATTRIBUTES forState:UIControlStateSelected];
    
    [self addChildViewController:childVC];
}

@end
