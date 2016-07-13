//
//  单例.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>

+ (instancetype)sharedRCChat {
    static dispatch_once_t token;
    static RCChat *instance;
    dispatch_once(&token, ^{
        instance = [[RCChat alloc] init];
    });
    return instance;
}