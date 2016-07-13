//
//  HttpManager.m
//  AFNetTest
//
//  Created by loulou on 16/6/9.
//  Copyright © 2016年 qxb. All rights reserved.
//http://www.jianshu.com/p/3b619832742e

#import "HttpManager.h"
#define BaseUrl  @""
@implementation HttpManager

+ (HttpManager *)sharedManager {
    
    static HttpManager *handle = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handle = [HttpManager manager];
        // 设置可接受的类型
        handle.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json",@"text/json",@"text/javascript",@"text/html",nil];
        
        
    });
    
    return handle;
    
}


//get请求
+ (void )get:(NSString *)url parameter:(id)parameters success:(void (^)(id responseObject))success faliure:(void (^)(id error))failure
{
    [[HttpManager sharedManager] GET:[BaseUrl stringByAppendingString:url] parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if(responseObject)  {
            
            success(responseObject);
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

//post请求
+ (void)post:(NSString *)url parameters:(id)parameters success:(void(^)(id responseObject))success faliure:(void(^)(id error))failure {
    [[HttpManager sharedManager] POST:[BaseUrl stringByAppendingString:url] parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if (responseObject) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}

@end
