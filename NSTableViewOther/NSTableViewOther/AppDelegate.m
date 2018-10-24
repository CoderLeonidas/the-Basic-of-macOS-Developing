//
//  AppDelegate.m
//  NSTableViewOther
//
//  Created by Leonidas on 2018/10/23.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "AppDelegate.h"

#define kDraggingDataTypeXXX @"kDraggingDataTypeXXX"

@interface AppDelegate () <NSTableViewDataSource, NSTableViewDelegate, NSMenuDelegate>
@property (weak) IBOutlet NSTableView *tableview;

@property (weak) IBOutlet NSWindow *window;

@property (nonatomic, strong) NSMenu *tablemenu;
@end

@implementation AppDelegate {
    NSMutableArray *_datas;
    
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSArray *data =    @[@{@"name": @"john", @"address": @"USA", @"gender": @"male", @"married": @(1)},
                @{@"name": @"mary", @"address": @"China", @"gender": @" female", @"married": @(0)},
                @{@"name": @"park", @"address": @"Japan", @"gender": @"male", @"married": @(0)},
                @{@"name": @"Daba", @"address": @"Russia", @"gender": @"female", @"married": @(1)}];
    _datas = [data mutableCopy];
    
    // 添加列表双击action
    [self.tableview setDoubleAction:@selector(tableviewDoubleAction:)];
    
    // 添加列表上下文菜单
    self.tableview.menu = self.tablemenu;
    [self.tableview registerForDraggedTypes:@[kDraggingDataTypeXXX]];
    [self.tableview reloadData];
}

- (void)setSort {
    [self.tableview setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(compare:)]]];
}

- (void)menuNeedsUpdate:(NSMenu *)menu {
    NSInteger clickedRow = [self.tableview clickedRow];
    NSInteger clickedColumn = self.tableview.clickedColumn;
    menu.title = [NSString stringWithFormat:@"row:%ld column:%ld", clickedRow, clickedColumn];
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


- (NSMenu *)tablemenu {
    if (nil == _tablemenu) {
        _tablemenu = [NSMenu  new];
        _tablemenu.delegate = self;
    }
    
    return _tablemenu;
}


- (void)tableView:(NSTableView *)tableView sortDescriptorsDidChange:(NSArray<NSSortDescriptor *> *)oldDescriptors {
    [_datas sortedArrayUsingDescriptors:[tableView sortDescriptors]];
    [self.tableview reloadData];
}

#pragma mark - drag & drop
- (BOOL)tableView:(NSTableView *)tableView writeRowsWithIndexes:(NSIndexSet *)rowIndexes toPasteboard:(NSPasteboard *)pboard {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:rowIndexes requiringSecureCoding:NO error:nil];
    [pboard declareTypes:@[kDraggingDataTypeXXX] owner:self];
    [pboard setData:data forType:kDraggingDataTypeXXX];
    return YES;
}

- (NSDragOperation)tableView:(NSTableView *)tableView validateDrop:(id<NSDraggingInfo>)info proposedRow:(NSInteger)row proposedDropOperation:(NSTableViewDropOperation)dropOperation {
    return NSDragOperationEvery;
}

- (BOOL)tableView:(NSTableView *)tableView acceptDrop:(id<NSDraggingInfo>)info row:(NSInteger)row dropOperation:(NSTableViewDropOperation)dropOperation {
    NSPasteboard *pboard = info.draggingPasteboard;
    NSData *data = [pboard dataForType:kDraggingDataTypeXXX];
    NSIndexSet *rowIndexes = [NSKeyedUnarchiver unarchivedObjectOfClass:[NSIndexSet class] fromData:data error:nil];
    NSInteger dragRow = [rowIndexes firstIndex];
    [_datas exchangeObjectAtIndex:row withObjectAtIndex:dragRow];
    [self.tableview reloadData];
    return YES;
    
}

@end
