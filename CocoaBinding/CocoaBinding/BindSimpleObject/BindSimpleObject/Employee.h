//
//  Employee.h
//  BindSimpleObject
//
//  Created by Leonidas on 2018/11/21.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Employee : NSObject
@property (nonatomic,assign) NSInteger ID;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,copy) NSString *address;
-(NSString *)description ;
@end

NS_ASSUME_NONNULL_END
