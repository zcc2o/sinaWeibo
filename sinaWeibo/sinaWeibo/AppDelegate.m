//
//  AppDelegate.m
//  sinaWeibo
//
//  Created by qx-005 on 16/12/6.
//  Copyright © 2016年 zcc. All rights reserved.
//

#import "AppDelegate.h"

#import "ZCCRandomColor.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    application.statusBarHidden = NO;
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UITabBarController *tabbarVC = [[UITabBarController alloc] init];
    
    
    
    UIViewController *vc1 = [[UIViewController alloc] init];
    
    vc1.view.frame = self.window.bounds;
    
    vc1.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    //设置tabbar
    
    vc1.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
    
    UIImage *selectedImage1 = [UIImage imageNamed:@"tabbar_home_selected"];
    //设置按下图片非自动填充
    UIImage *noRenderImage1 = [selectedImage1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc1.tabBarItem.selectedImage = noRenderImage1;
    
    vc1.tabBarItem.title = @"首页";
    
    //设置按下字体非自动填充
    NSDictionary *titleAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:241*1.0/255 green:109*1.0/255 blue:10*1.0/255 alpha:1.0]};
    
    [vc1.tabBarItem setTitleTextAttributes:titleAttributes forState:UIControlStateSelected];
    
    [tabbarVC addChildViewController:vc1];

    
    UIViewController *vc2 = [[UIViewController alloc] init];
    
    vc2.view.frame = self.window.bounds;
    
    vc2.view.backgroundColor = ZCCRCOLOR;
    
    vc2.tabBarItem.image = [UIImage imageNamed:@"tabbar_message_center"];
    
    UIImage *selectedImage2 = [UIImage imageNamed:@"tabbar_message_center_selected"];
    
    UIImage *noRenderImage2 = [selectedImage2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc2.tabBarItem.selectedImage = noRenderImage2;
    
    vc2.tabBarItem.title = @"消息";
    
    [vc2.tabBarItem setTitleTextAttributes:titleAttributes forState:UIControlStateSelected];
    
    [tabbarVC addChildViewController:vc2];
    
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    
    vc3.view.frame = self.window.bounds;
    
    vc3.view.backgroundColor = ZCCRCOLOR;
    
    vc3.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
    
    UIImage *selectedImage3 = [UIImage imageNamed:@"tabbar_discover_selected"];
    
    UIImage *noRenderImage3 = [selectedImage3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc3.tabBarItem.selectedImage = noRenderImage3;
    
    vc3.tabBarItem.title = @"发现";
    
    [vc3.tabBarItem setTitleTextAttributes:titleAttributes forState:UIControlStateSelected];
    
    [tabbarVC addChildViewController:vc3];
    
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    
    vc4.view.frame = self.window.bounds;
    
    vc4.view.backgroundColor = ZCCRCOLOR;
    
    vc4.tabBarItem.image = [UIImage imageNamed:@"tabbar_profile"];
    
    UIImage *selectedImage4 = [UIImage imageNamed:@"tabbar_profile_selected"];
    
    UIImage *noRenderImage4 = [selectedImage4 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc4.tabBarItem.selectedImage = noRenderImage4;
    
    vc4.tabBarItem.title = @"我";
    
    [vc4.tabBarItem setTitleTextAttributes:titleAttributes forState:UIControlStateSelected];
    
    [tabbarVC addChildViewController:vc4];

    
    self.window.rootViewController = tabbarVC;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.zcc2016.sinaWeibo" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"sinaWeibo" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"sinaWeibo.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
