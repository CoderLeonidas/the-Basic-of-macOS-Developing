//
//  AppDelegate.m
//  CocoaBinding
//
//  Created by Leonidas on 2018/11/21.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "AppDelegate.h"




@implementation Person
- (NSString *)description {
    return [NSString stringWithFormat:@"name:%@ age:%ld male:%d", _name, _age, _male];
}

@end


@implementation PersonNew
- (NSString *)description {
    return [NSString stringWithFormat:@"name:%@ age:%@ male:%@", _name, _age, _male];
}

@end

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application

    [self write];
}

- (void)read {
    Person *person = [Person new];
    person.name = @"Tim";
    person.age = 21;
    person.male = YES;
    
    NSDictionary *dic = [person dictionaryWithValuesForKeys:@[@"name", @"age", @"male"]];
    
    NSLog(@"person = %@", dic);
}

- (void)write {
    NSDictionary *dic = @{@"name":@"luoyang",
                          @"age":@28,
                          @"male":@(YES)};

    Person *person = [Person new];
    [person setValuesForKeysWithDictionary:dic];
    NSLog(@"person = %@", person);
    
    
//    NSDictionary *dic = @{@"name":@"luoyang",
//                          @"age":@"28",
//                          @"male":@"YES"};
//
//    PersonNew *person = [PersonNew new];
//    [person setValuesForKeysWithDictionary:dic];
//    NSLog(@"person = %@", person);
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
