//
//  正则表达.m
//  Note
//
//  Created by loulou on 16/6/29.
//
//

#import <Foundation/Foundation.h>
NSString *regex =[NSString stringWithFormat:@"^1(3[4-9]|5[012789]|8[2378]|47)\\d{8}$"];
NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
BOOL isMatch = [predicate evaluateWithObject:editPhoneField.text];
