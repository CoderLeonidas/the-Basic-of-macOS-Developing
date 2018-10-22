//
//  AppDelegate.m
//  NSTableViewOther
//
//  Created by Leonidas on 2018/10/23.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () <NSTableViewDataSource, NSTableViewDelegate>
@property (weak) IBOutlet NSTableView *tableview;

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate {
    NSArray *_datas;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    _datas = @ [
                @{@"name": @"john", @"address": @"USA", @"gender": @"male", @"married": @ (1) },
                @{@"name": @"mary", @"address": @"China", @"gender": @" female", @"married": @ (0) },
                @{@"name": @"park", @"address": @"Japan", @"gender": @"male", @"married": @ (0) },
                @{@"name": @"Daba", @"address": @"Russia", @"gender": @"female", @"married": @ (1) }];
    
    // 添加列表双击action
    [self.tableview setDoubleAction:@selector(tableviewDoubleAction:)];
    [self.tableview reloadData];
}


- (void)tableviewDoubleAction:(id)sender {
    NSLog(@"tableviewDoubleAction");
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return _datas.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    // 获取row数据
    NSDictionary *data = _datas[row];
    // 表格列的标识
    NSString *identifier = tableColumn.identifier;
    // 单元格数据
    NSString *value  = data[identifier];
    // 根据列的标识，创建单元格视图
    NSView *view = [tableView makeViewWithIdentifier:identifier owner:self];
    NSArray *subviews = [view subviews];
    for (NSView *subview in subviews) {
        if (![subview.identifier isEqualToString:identifier]) {
            //            continue;
        }
        if ([identifier isEqualToString:@"name"] || [identifier isEqualToString:@"address"]) {
            NSTextField *textfield = (NSTextField *)subview;
            // 更新单元格文本
            if (value) {
                textfield.stringValue = value;
            }
        }
        
        if ([identifier isEqualToString:@"gender"]) {
            NSComboBox *combobox = (NSComboBox *)subview;
            if (value) {
                combobox.stringValue = value;
            }
        }
        
        if ([identifier isEqualToString:@"married"]) {
            NSButton *checkbutton = (NSButton *)subview;
            if (value) {
                checkbutton.state = [value boolValue];
            }
        }
    }
    return view;
}

// 列表选中改变
- (void)tableViewSelectionDidChange:(NSNotification *)notification {
    NSInteger row = [notification.object selectedRow];
    NSLog(@"selectedRow = %ld", row);
}



@end
