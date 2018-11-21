//
//  AppDelegate.h
//  CocoaBinding
//
//  Created by Leonidas on 2018/11/21.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@interface Person: NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,assign) BOOL male;
- (NSString *)descriptiNewon;
@end

@interface PersonNew: NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *age;
@property (nonatomic,copy) NSString *male;

- (NSString *)description;
@end

@interface AppDelegate : NSObject <NSApplicationDelegate>


@end

