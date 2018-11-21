//
//  AppDelegate.m
//  NSSetDemo
//
//  Created by Leonidas on 2018/10/31.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "AppDelegate.h"

@implementation LYObj
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age {
    if (self = [super init]) {
        _name = [name copy];
        _age = age;
    }
    return self;
}

//- (BOOL)isEqual:(id)object {
//    LYObj *obj = (LYObj*)object;
//    return ([self.name isEqualToString:obj.name] && self.age == obj.age);
//}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@:%ld",_name, _age];
}

@end


@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
 
    
    
    
}

- (NSArray *)jiaojiWithArr1:(NSArray *)arr1 arr2:(NSArray *)arr2 {
    NSMutableSet *set1 = [NSMutableSet setWithArray:arr1];
    NSMutableSet *set2 = [NSMutableSet setWithArray:arr2];
    
    [set1 intersectSet:set2];
    return [set1 allObjects];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)testBtnClicked:(id)sender {
    LYObj *obj1 = [[LYObj alloc] initWithName:@"leo" age:20];
    LYObj *obj2 = [[LYObj alloc] initWithName:@"bj" age:20];
    LYObj *obj3 = [[LYObj alloc] initWithName:@"may" age:20];
    
    
    LYObj *obj4 = [[LYObj alloc] initWithName:@"john" age:20];
    LYObj *obj5 = [[LYObj alloc] initWithName:@"tim" age:20];
    LYObj *obj6 = [[LYObj alloc] initWithName:@"leo" age:20];
    
    
    
    NSArray * arr = @[obj1, obj2, obj3];//@[@1,@2,@3];
    NSArray * arr2 = @[obj4,obj5,obj6];//@[@1,@2,@3,@4];
    
    NSLog(@"%@", [self jiaojiWithArr1:arr arr2:arr2]);
}


@end
