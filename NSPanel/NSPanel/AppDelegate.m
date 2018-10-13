//
//  AppDelegate.m
//  NSPanel
//
//  Created by Leonidas on 2018/10/10.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (weak) IBOutlet NSPanel *loginPanel;
@property (weak) IBOutlet NSButton *loginButton;
@property (weak) IBOutlet NSTextField *userName;
@property (weak) IBOutlet NSTextField *pwd;
@property (unsafe_unretained) IBOutlet NSTextView *textView;

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate {
    NSFont *_font;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    _font = [NSFont systemFontOfSize:13.0];
}

- (IBAction)loginButtonClicked:(id)sender {
    [self.window beginSheet:self.loginPanel completionHandler:^(NSModalResponse returnCode) {
        NSString *userName = self.userName.stringValue;
        NSString *pwd = self.pwd.stringValue;
        NSLog(@"username = %@", userName);
        NSLog(@"pwd = %@", pwd);
    }];
}
- (IBAction)okButtonClicked:(id)sender {
    [self.window endSheet:self.loginPanel];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)openFilePanel:(id)sender {
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    openPanel.canChooseFiles = YES;
    openPanel.canChooseDirectories = YES;
    openPanel.allowedFileTypes = @[@"txt"];
    openPanel.allowsMultipleSelection = YES;
    [openPanel beginWithCompletionHandler:^(NSModalResponse result) {
        if (result == NSModalResponseOK) {
            NSArray *fileURLs = [openPanel URLs];
            for (NSURL *url in fileURLs) {
                NSError *error;
                NSString *string = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
                if (!error) {
                    self.textView.string = string;
                }
            }
        }
    }];
    
}

- (IBAction)saveFileAction:(id)sender {
    NSSavePanel *savePanel = [[NSSavePanel alloc] init];
    savePanel.title = @"save panel";
    savePanel.message = @"save message";
    savePanel.allowedFileTypes = @[@"txt"];
    savePanel.nameFieldStringValue = @"my";
    [savePanel beginWithCompletionHandler:^(NSModalResponse result) {
        if (result == NSModalResponseOK) {
            NSURL *url = [savePanel URL];
            NSLog(@"file path = %@", url);
            NSString *text = self.textView.string;
            NSError *error;
            [text writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:&error];
            if (error) {
                NSLog(@"save file error: %@", error);
            }
        
        }
    }];
    
}

- (IBAction)changeFont:(id)sender {
//    NSFontPanel *fontPanel = [NSFontPanel sharedFontPanel];
//
//    [fontPanel orderFront:nil];
    NSFontManager *fontManager = [NSFontManager sharedFontManager];
    fontManager.target = self;
    fontManager.action = @selector(setFont:);
    [fontManager orderFrontFontPanel:self];
}

- (void)setFont:(id)sender {
    _font = [sender convertFont:_font];
    self.textView.font = _font;
}

- (IBAction)changeColor:(id)sender {
    NSColorPanel *colorPanel = [NSColorPanel sharedColorPanel];
    [colorPanel setTarget:self];
    [colorPanel setAction:@selector(setColor:)];
    [colorPanel orderFront:nil];

}
- (void)setColor:(id)sender {
    NSColorPanel *colorPanel = sender;
    NSColor *color = colorPanel.color;
    self.textView.textColor = color;
    
}
@end
