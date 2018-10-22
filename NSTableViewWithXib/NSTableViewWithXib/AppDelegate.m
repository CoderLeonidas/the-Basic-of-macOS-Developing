//
//  AppDelegate.m
//  NSTableViewWithXib
//
//  Created by Leonidas on 2018/10/22.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () <NSTableViewDelegate, NSTableViewDataSource>

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTableView *tableview;

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
    
    [self.tableview reloadData];
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return _datas.count;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSDictionary *data = _datas[row];
    NSString *key = tableColumn.identifier;
    NSString *value = data[key];
    return value;
}

- (BOOL)tableView:(NSTableView *)tableView shouldEditTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    return YES;
}



@end
