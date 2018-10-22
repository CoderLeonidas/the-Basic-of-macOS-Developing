//
//  LYViewController2.m
//  NSViewController
//
//  Created by Leonidas on 2018/10/18.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "LYViewController2.h"

@interface LYViewController2 ()

@end

@implementation LYViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (void)loadView {
    CGRect frame = CGRectMake(0, 0, 200, 200);
    NSView *view = [[NSView alloc] initWithFrame:frame];
    view.wantsLayer = YES;
    view.layer.backgroundColor = [[NSColor redColor] colorWithAlphaComponent:0.7].CGColor;
    self.view = view;
}

@end
