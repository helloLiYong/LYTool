//
//  NSString+extention.m
//  Tools
//
//  Created by 李勇 on 2018/2/22.
//  Copyright © 2018年 李勇. All rights reserved.
//

#import "NSString+extention.h"
#import <objc/message.h>
@implementation NSString (extention)
+(void)load{
    Method method1 = class_getInstanceMethod(self,  @selector(stringByAppendingString:));

    Method method2 = class_getInstanceMethod(self,  @selector(ly_stringAppendingString:));
    method_exchangeImplementations(method1, method2);
}
-(NSString *)ly_stringAppendingString:(NSString *)string{
    if (string == nil && self != nil) {
        NSLog(@"传入的string为空值");
        return self;
    }else if(string != nil && self == nil){
        NSLog(@"selfString为空值");
        return string;
    }else if(string == nil && self == nil){
        NSLog(@"都为空值");
        return @"";
    }else if(string != nil && self != nil){
        return [self ly_stringAppendingString:string];
    }else{
        return @"";
    }

}
@end
