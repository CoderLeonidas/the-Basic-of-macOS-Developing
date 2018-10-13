//
//  AppDelegate.m
//  NSMenu
//
//  Created by Leonidas on 2018/10/12.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (weak) IBOutlet NSMenu *myMenu;

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.window.contentView = [[NSView alloc] initWithFrame:self.window.frame];
    self.window.contentView.wantsLayer = YES;
    self.window.contentView.layer.backgroundColor = [[NSColor redColor] colorWithAlphaComponent:0.6].CGColor;
    // 直接设置view的menu可以右键弹出该menu
    self.window.contentView.menu = self.myMenu;
    
    // 代码创建菜单，并右键弹出
//    [self createMenu];
//    [self getAppDefaultMenu];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

// 在Docker上显示菜单，menuitem的图片不会显示
- (NSMenu *)applicationDockMenu:(NSApplication *)sender {
    return self.myMenu;
}

- (IBAction)popButtonClicked:(id)sender {
    NSButton *button = (NSButton *)sender;
    NSPoint pt = button.frame.origin;
    pt.x += button.frame.size.width;
    // 点击按钮弹出菜单
    [self.myMenu popUpMenuPositioningItem:nil atLocation:pt inView:self.window.contentView];
}

// 代码创建
- (void)createMenu {
    // 创建菜单对象
    NSMenu *customMenu = [[NSMenu alloc] init];
    // 创建子菜单
    NSMenuItem *openMenuItem = [[NSMenuItem alloc] initWithTitle:@"Open" action:@selector(menuClicked:) keyEquivalent:@"O"];
    // 菜单快捷键为 Shift+O的组合
    [openMenuItem setKeyEquivalentModifierMask:NSEventModifierFlagShift];
    // 子菜单里增加二级菜单
    NSMenuItem *openRecentMenuItem = [[NSMenuItem alloc] initWithTitle:@"Open Recent..." action:nil keyEquivalent:@""];
    NSMenu *recentMenu = [[NSMenu alloc] init];
    // 设置子菜单的二级菜单
    [openRecentMenuItem setSubmenu:recentMenu];
    NSMenuItem *file1MenuItem = [[NSMenuItem alloc] initWithTitle:@"File1" action:nil keyEquivalent:@""];
    [recentMenu addItem:file1MenuItem];
    // 增加子菜单到上一级
    [customMenu addItem:openMenuItem];
    [customMenu addItem:openRecentMenuItem];
    self.window.contentView.menu =customMenu;

}
// 获取app应用的默认菜单
- (void)getAppDefaultMenu {
    NSMenu *menu = [NSApp menu];
    NSArray *subItems = menu.itemArray;
    for (NSMenuItem *item  in subItems) {
        NSString *title = item.title;
        NSLog(@"title = %@", title);
        NSMenu *subMenu = item.submenu;
        NSArray *subSubitems = [subMenu itemArray];
        for (NSMenuItem *subsubItem in subSubitems) {
            NSLog(@"subSubitems:%@", subsubItem.title);
        }
    }
}

// 菜单有效性验证
//-(BOOL)validateMenuItem: (NSMenuItem *) menuItem {
//    if ([menuItem action] - @selector (closeTab:)) {
//        if (! [tabBar canCloseOnlyTab] &&  ([tabView numberOfTabViewItems]  <= 1))}
//            return NO;
//        }
//    }
//    return YES;
//}

@end
