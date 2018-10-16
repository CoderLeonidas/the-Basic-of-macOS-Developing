//
//  AppDelegate.m
//  NSWindowArchitecture
//
//  Created by Leonidas on 2018/10/15.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "AppDelegate.h"
#import "AppMainWindowController.h"


@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (nonatomic, strong) AppMainWindowController *appMainWindowController;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [self.appMainWindowController.window makeKeyAndOrderFront:self];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (AppMainWindowController *)appMainWindowController {
    if (nil == _appMainWindowController) {
        _appMainWindowController = [AppMainWindowController  new];
        
    }
    
    return _appMainWindowController;
}


@end
