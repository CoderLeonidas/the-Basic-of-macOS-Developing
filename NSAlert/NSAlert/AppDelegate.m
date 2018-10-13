//
//  AppDelegate.m
//  NSAlert
//
//  Created by Leonidas on 2018/10/11.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (weak) IBOutlet NSSecureTextField *password;
@property (weak) IBOutlet NSButton *registerButton;

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)registerButtonClicked:(id)sender {
    NSString *pwd = self.password.stringValue;
    if (pwd.length < 6) {
        NSAlert *alert = [[NSAlert alloc] init];
        // 增加一个按钮
        [alert addButtonWithTitle:@"OK"];
        // 提示的标题
        [alert setMessageText:@"Alert"];
        // 提示的详细内容
        [alert setInformativeText:@"password length must be more than 6!"];
        // 设置告警风格
        [alert setAlertStyle:NSAlertStyleInformational];
        // 开始显示告警
        [alert beginSheetModalForWindow:self.window completionHandler:^(NSModalResponse returnCode) {
            NSLog(@"user clicked!!");
        }];
        return;
    }
}


@end
