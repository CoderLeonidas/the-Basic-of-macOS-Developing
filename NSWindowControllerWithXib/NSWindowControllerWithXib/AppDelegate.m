//
//  AppDelegate.m
//  NSWindowControllerWithXib
//
//  Created by Leonidas on 2018/10/15.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "AppDelegate.h"

#import "MyWindow.h"
@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;
@property (nonatomic, strong) MyWindow *myWindow;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (MyWindow *)myWindow{
    if (nil == _myWindow) {
        NSRect frame = CGRectMake(0, 0, 400, 200);
        NSUInteger style = NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskMiniaturizable;
        
        _myWindow = [[MyWindow  alloc] initWithContentRect:frame styleMask:style backing:NSBackingStoreBuffered defer:YES];
        _myWindow.title = @"new create window";
        
    }
    
    return _myWindow;
}

- (IBAction)showWindowAction:(id)sender {
    [self.myWindow makeKeyAndOrderFront:self];
    [self.myWindow center];
}
@end
