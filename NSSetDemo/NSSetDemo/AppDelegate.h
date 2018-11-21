//
//  AppDelegate.h
//  NSSetDemo
//
//  Created by Leonidas on 2018/10/31.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>


@end

@interface LYObj : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger age;
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;
-(NSString *)description;
@end

