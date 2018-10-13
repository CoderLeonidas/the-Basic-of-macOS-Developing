//
//  MyPanel.m
//  SingleXibPanel
//
//  Created by Leonidas on 2018/10/11.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "MyPanel.h"

@implementation MyPanel

- (IBAction)cancelActon:(id)sender {
    [self.parentWindow endSheet:self returnCode:1];
}

- (IBAction)okAction:(id)sender {
    [self.parentWindow endSheet:self returnCode:2];
}

@end
