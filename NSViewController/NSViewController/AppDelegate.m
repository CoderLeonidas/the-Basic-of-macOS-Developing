//
//  AppDelegate.m
//  NSViewController
//
//  Created by Leonidas on 2018/10/18.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "AppDelegate.h"
#import "LYViewController.h"
#import "LYViewController2.h"
#import "LYViewController3.h"


@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (strong, nonatomic) LYViewController *vc;
@property (strong, nonatomic) LYViewController2 *vc2;
@property (strong, nonatomic) LYViewController3 *vc3;

@property (strong, nonatomic) NSViewController *myVC;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    // 1、xib创建
//        [self.window.contentView addSubview:self.vc.view];
    // 2 sb创建
//    NSStoryboard *storyboard = [NSStoryboard storyboardWithName:@"Storyboard" bundle:nil];
//    self.myVC = [storyboard instantiateControllerWithIdentifier:@"myVC"];
//    [self.window.contentView addSubview:self.myVC.view];
    // 3 代码创建
//    [self.window.contentView addSubview:self.vc2.view];
    
    // 4 基于xib模板创建
        [self.window.contentView addSubview:self.vc3.view];

}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (LYViewController *)vc {
    if (nil == _vc) {
        _vc = [[LYViewController alloc] initWithNibName:@"LYViewController" bundle:nil];
//        _vc.view.frame = self.window.contentView.frame;
//        _vc.view.bounds = self.window.contentView.bounds;
        _vc.view.frame = self.window.contentView.bounds;
//        _vc.view.bounds = self.window.contentView.frame;
    }
    return _vc;
}

- (LYViewController2 *)vc2 {
    if (nil == _vc2) {
        _vc2 = [[LYViewController2 alloc] init];
        _vc2.view.bounds = self.window.contentView.bounds;

    }
    
    return _vc2;
}


- (LYViewController3 *)vc3 {
    if (nil == _vc3) {
        _vc3 = [[LYViewController3 alloc] init];
        _vc3.view.bounds = self.window.contentView.bounds;

    }
    
    return _vc3;
}



@end
