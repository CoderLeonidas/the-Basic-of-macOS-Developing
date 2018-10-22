//
//  AppDelegate.m
//  NSTableViewWithArrayController
//
//  Created by Leonidas on 2@18/1@/23.
//  Copyright © 2@18 EMMac. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (nonatomic, copy) NSArray *mydatas;
@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate {
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    self.mydatas = @[@{@"name":@"john",@"address": @"USA"},
                     @{@"name": @"mary", @"address": @"China"},
                     @{@"name": @"park",@"address": @"Japan"},
                     @{@"name":@"Daba",@"address": @"Russia"},
                     @{@"name":@"Leo",@"address": @"China"}];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
