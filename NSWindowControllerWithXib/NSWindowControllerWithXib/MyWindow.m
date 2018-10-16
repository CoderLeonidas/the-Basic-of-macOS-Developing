//
//  MyWindow.m
//  NSWindowControllerWithXib
//
//  Created by Leonidas on 2018/10/15.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "MyWindow.h"

@implementation MyWindow

- (instancetype)initWithContentRect:(NSRect)contentRect styleMask:(NSWindowStyleMask)style backing:(NSBackingStoreType)backingStoreType defer:(BOOL)flag {
    return [super initWithContentRect:contentRect
                            styleMask:style
                              backing:backingStoreType defer:flag];
}
- (void)makeKeyWindow {
    [super makeKeyWindow];
}

- (void)makeKeyAndOrderFront:(id)sender {
    [super makeKeyAndOrderFront:sender];
}

- (void)orderFront:(id)sender {
    [super orderFront:sender];
}

- (void)orderOut:(id)sender {
    [super orderOut:sender];
}

- (void)dealloc {
    NSLog(@"window close");
}
@end
