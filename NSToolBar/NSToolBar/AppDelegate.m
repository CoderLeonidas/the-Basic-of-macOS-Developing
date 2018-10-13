//
//  AppDelegate.m
//  NSToolBar
//
//  Created by Leonidas on 2018/10/11.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)toolbarItemClicked:(id)sender {
    NSToolbarItem *item = sender;
    NSInteger tag = item.tag;
    switch (tag) {
        case 0: {
            
        }
            break;
        case 1: {
            
        }
            break;
        case 2: {
            
        }
            break;
            
        default:
            break;
    }
}

- (BOOL)validateToolbarItem:(NSToolbarItem *)item {
    if ([item.itemIdentifier isEqualToString:@"NSToolbarShowFontsItem"]) {
        item.enabled = NO;
        return NO;
    }
    return YES;
}

@end
