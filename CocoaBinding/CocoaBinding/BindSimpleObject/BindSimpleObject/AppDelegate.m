//
//  AppDelegate.m
//  BindSimpleObject
//
//  Created by Leonidas on 2018/11/21.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "AppDelegate.h"
#import "Employee.h"

@interface AppDelegate ()  <NSEditorRegistration, NSEditor>
@property (nonatomic,strong) Employee *employee;

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSObjectController *objectController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    Employee *em = [Employee new];
    em.ID = 100;
    em.name = @"leo";
    em.age = 28;
    em.address = @"ShangHai";
    self.employee = em;
    
    // 使用代码绑定
//    [self.objectController bind:@"content"
//                       toObject:self
//                    withKeyPath:@"employee"
//                        options:0];
}

// 使用代码绑定 - 解绑
//- (void)dealloc {
//    [self.objectController unbind:@"content"];
//}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)okBtnClicked:(id)sender {
    NSLog(@"employee = %@", self.employee);
}

- (void)objectDidEndEditing:(id<NSEditor>)editor {
    NSLog(@"end edit:%@", self.employee);
}

- (void)objectDidBeginEditing:(id<NSEditor>)editor {
    NSLog(@"begin edit:%@", self.employee);

}
//
- (void)discardEditing {

}

- (BOOL)commitEditing {
    return YES;
}


@end
