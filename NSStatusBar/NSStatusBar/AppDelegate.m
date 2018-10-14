//
//  AppDelegate.m
//  NSStatusBar
//
//  Created by Leonidas on 2018/10/13.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "AppDelegate.h"
#import "AppViewController.h"

@interface AppDelegate ()
@property (weak) IBOutlet NSMenu *shareMenu;

@property (weak) IBOutlet NSWindow *window;
@property (nonatomic, strong) NSStatusItem *item;
@property (nonatomic, strong) NSPopover *popover;
@end

@implementation AppDelegate {
    BOOL _isShow;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // 添加statusItem到系统statusBar
    NSStatusItem * item = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [item.button setTarget:self];
    [item.button setAction:@selector(itemAction:)];
    // 设置图片
    item.button.image = [NSImage imageNamed:@"youdao.png"];
    // 设置下拉菜单
//    item.menu = self.shareMenu;
    self.item = item;
    // 设置弹出菜单
    [self setupPopover];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
    [[NSStatusBar systemStatusBar] removeStatusItem:self.item];
}

- (void)itemAction:(id)sender {
    NSLog(@"itemAction");
    // 激活应用到前台(如果应用窗口处于非活动状态)
//    [[NSRunningApplication currentApplication] activateWithOptions:(NSApplicationActivateAllWindows | NSApplicationActivateIgnoringOtherApps)];
    
    if (_isShow) {
        [self.popover showRelativeToRect:NSZeroRect ofView:self.item.button preferredEdge:NSRectEdgeMinY];
    } else {
        [self.popover close];
    }
    _isShow = ~_isShow;
    
}

- (void)setupPopover {
    self.popover = [[NSPopover alloc] init];
    self.popover.contentViewController = [[AppViewController alloc] init];
    self.popover.behavior = NSPopoverBehaviorApplicationDefined;
}

@end
