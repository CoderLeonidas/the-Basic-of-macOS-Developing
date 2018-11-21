
//
//  Employee.m
//  BindSimpleObject
//
//  Created by Leonidas on 2018/11/21.
//  Copyright © 2018 EMMac. All rights reserved.
//

#import "Employee.h"

@implementation Employee
-(NSString *)description {
    return [NSString stringWithFormat:@"id:%ld, name:%@, age:%ld, address:%@", _ID, _name, _age, _address];
}


@end
