//
//  AppDelegate.m
//  NSSavePanel
//
//  Created by Leonidas on 2018/10/11.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (unsafe_unretained) IBOutlet NSTextView *textView;

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)saveAction:(id)sender {
    NSSavePanel *savePanel = [[NSSavePanel alloc] init];
    [savePanel beginWithCompletionHandler:^(NSModalResponse result) {
        
    }];
}

@end
