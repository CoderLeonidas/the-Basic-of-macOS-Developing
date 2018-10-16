//
//  AppDelegate.m
//  NSWindowControllerAndNSWindow
//
//  Created by Leonidas on 2018/10/15.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "AppDelegate.h"

#import "MyWindow.h"

@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;
@property (nonatomic, strong) MyWindow *myWindow;
@property (nonatomic, strong) NSWindowController *windowController;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)showWindowAction:(id)sender {
    [self.myWindow makeKeyAndOrderFront:self];
    
}

- (MyWindow *)myWindow {
    if (nil == _myWindow) {
        NSRect frame = NSMakeRect(0, 0, 400, 200);
        NSUInteger style = NSWindowStyleMaskMiniaturizable |NSWindowStyleMaskClosable | NSWindowStyleMaskTitled | NSWindowStyleMaskResizable;
        _myWindow = [[MyWindow alloc] initWithContentRect:frame styleMask:style backing:NSBackingStoreBuffered defer:YES];
        _myWindow.windowController = self.windowController;
    }
    return _myWindow;
}

- (NSWindowController *)windowController {
    if (nil == _windowController) {
        _windowController = [NSWindowController new];
        _windowController.window = self.myWindow;
    }
    
    return _windowController;
}
@end
