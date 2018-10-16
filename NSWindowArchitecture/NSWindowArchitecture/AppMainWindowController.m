//
//  AppMainWindowController.m
//  NSWindowArchitecture
//
//  Created by Leonidas on 2018/10/15.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "AppMainWindowController.h"

@interface AppMainWindowController ()

@end

@implementation AppMainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    [self.window center];
}

- (NSNibName)windowNibName {
    return @"AppMainWindowController";
}

@end
