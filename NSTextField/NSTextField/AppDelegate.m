//
//  AppDelegate.m
//  NSTextField
//
//  Created by Leonidas on 2018/10/18.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "AppDelegate.h"
#import "LYView.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (nonatomic, strong) NSView *container;
@end

@implementation AppDelegate
#define Spacing 10
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    NSTextField *label = [NSTextField wrappingLabelWithString:@"Hello,Leonidas "];
    label.font = [NSFont systemFontOfSize:20];
    label.drawsBackground = YES;
    label.backgroundColor = [[NSColor redColor] colorWithAlphaComponent:0.5];
    [label setFrameOrigin:NSMakePoint(Spacing, 0)];
    [label sizeToFit];
    [self.container addSubview:label];
    
    NSTextField *label2 = [NSTextField wrappingLabelWithString:@"Welcome to My World"];
    label2.font = [NSFont systemFontOfSize:20];
    label2.drawsBackground = YES;
    label2.backgroundColor = [[NSColor redColor] colorWithAlphaComponent:0.5];
    [label2 setFrameOrigin:NSMakePoint(Spacing + NSWidth(label.frame), 0)];
//    [label2 sizeToFit];
    [self.container addSubview:label2];

    [self.window.contentView addSubview:self.container];
    self.container.frame = NSMakeRect(50, 50, NSWidth(label.frame) + NSWidth(label2.frame) + 2 * Spacing, NSHeight(label.frame));
    [self.window orderFront:nil];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (NSView *)container {
    if (nil == _container) {
        _container = [NSView new];
        _container.wantsLayer = YES;
        _container.layer.backgroundColor = [[NSColor orangeColor] colorWithAlphaComponent:0.5].CGColor;
    }
    
    return _container;
}




@end
