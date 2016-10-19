//
//  Model.m
//  Note
//
//  Created by Loulou on 16/7/29.
//
//

#import <Foundation/Foundation.h>

一般情况下，我们不想因为服务器的某个值没有返回就使程序崩溃， 我们会加关键字Optional.

@property (strong, nonatomic) NSNumber<Optional>* number;