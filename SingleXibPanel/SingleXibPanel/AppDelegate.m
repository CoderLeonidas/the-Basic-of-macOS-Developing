//
//  AppDelegate.m
//  SingleXibPanel
//
//  Created by Leonidas on 2018/10/11.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "AppDelegate.h"
#import "MyPanel.h"
@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (nonatomic, strong) MyPanel *panel;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)showPanelAction:(id)sender {
    self.panel.parentWindow = self.window;
    [self.window beginSheet:self.panel completionHandler:^(NSModalResponse returnCode) {
        NSLog(@"returnCode = %ld", returnCode);
    }];
    
}

- (MyPanel *)panel {
    if (nil == _panel) {

        NSNib *nib = [[NSNib alloc] initWithNibNamed:@"MyPanel" bundle:nil];
        NSArray *topLevelObjects;
        if ([nib instantiateWithOwner:self topLevelObjects:&topLevelObjects]) {
            for (id topLevelObject in topLevelObjects) {
                if ([topLevelObject isKindOfClass:[MyPanel class]]) {
                    _panel = topLevelObject;
                    break;
                }
            }
        }
        
    }
    
    return _panel;
}


@end
