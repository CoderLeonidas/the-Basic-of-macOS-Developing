//
//  AppDelegate.m
//  代码创建NSToolBar
//
//  Created by Leonidas on 2018/10/11.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "AppDelegate.h"

#define kFontToolBarItemTag 1
#define kSaveToolBarItemTag 2

#define kFontSetting @"FontSetting"
#define kSave @"Save"

@interface AppDelegate () <NSToolbarDelegate>
@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Toolbar 和左。上角控制窗口关闭、最小化和全屏的三个按钮在同一行，这个特性需要 10.10 及以上的系统。
    self.window.titleVisibility = NSWindowTitleHidden;
    
    [self setupToolBar];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {

}

- (void)setupToolBar {
    NSToolbar *toolBar = [[NSToolbar alloc] initWithIdentifier:@"AppToolbar"];
    // 此标志控制用户是否可以通过拖动项来配置工具栏，以及是否可以使用自定义面板。默认值为NO，但可以随时更改。例如，开发人员可能不希望用户在处理某些事件时能够编辑工具栏。
    [toolBar setAllowsUserCustomization:NO];
    // 指示接收器是否自动保存其配置的布尔值。
    [toolBar setAutosavesConfiguration:NO];
    // 工具栏的显示模式。
    [toolBar setDisplayMode:NSToolbarDisplayModeIconAndLabel];
    // 工具栏的大小模式。
    [toolBar setSizeMode:NSToolbarSizeModeSmall];
    [toolBar setDelegate:self];
    [self.window setToolbar:toolBar];

}

#pragma mark - NSToolbarDelegate

// 所有的item标识
- (NSArray<NSToolbarItemIdentifier> *)toolbarAllowedItemIdentifiers:(NSToolbar *)toolbar {
    return @[kFontSetting, kSave];
}

// 实际显示的item标识
- (NSArray<NSToolbarItemIdentifier> *)toolbarDefaultItemIdentifiers:(NSToolbar *)toolbar {
    return @[kFontSetting, kSave];
}

// 根据item标识返回每个具体的NSToolBarItem对象实例
- (NSToolbarItem *)toolbar:(NSToolbar *)toolbar itemForItemIdentifier:(NSToolbarItemIdentifier)itemIdentifier willBeInsertedIntoToolbar:(BOOL)flag {
    NSToolbarItem *toolBarItem = [[NSToolbarItem alloc] initWithItemIdentifier:itemIdentifier];
    toolBarItem.view = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 20, 20)];
    toolBarItem.view.wantsLayer = YES;

    if ([itemIdentifier isEqualToString:kFontSetting]){
        [toolBarItem setLabel:@"Font"];
        [toolBarItem setPaletteLabel:@"Font"];
        [toolBarItem setToolTip:@"Font Setting"];
//        [toolBarItem setImage:[NSImage imageNamed:@"FontSetting"]];
        toolBarItem.tag = kFontToolBarItemTag;
        toolBarItem.view.layer.backgroundColor = [NSColor redColor].CGColor;
        
    } else if ([itemIdentifier isEqualToString:kSave]){
        [toolBarItem setLabel:@"Save"];
        [toolBarItem setPaletteLabel:@"Save"];
        [toolBarItem setToolTip:@"Save File"];
//        [toolBarItem setImage:[NSImage imageNamed:@"Save"]];
        toolBarItem.tag = kSaveToolBarItemTag;
        toolBarItem.view.layer.backgroundColor = [NSColor yellowColor].CGColor;

    } else {
        toolBarItem = nil;
    }
    [toolBarItem setMinSize:CGSizeMake(25, 25)];
    [toolBarItem setMaxSize:CGSizeMake(100, 100)];
    [toolBarItem setTarget:self];
    [toolBarItem setAction:@selector(toolbarItemClicked:)];
    
    return toolBarItem;
}

- (void)toolbarItemClicked:(id)sender {
    NSToolbarItem *item = sender;
    
    NSLog(@"【%@】 被点击", item.itemIdentifier);
}


@end
