//
//  HttpManager.h
//  AFNetTest
//
//  Created by loulou on 16/6/9.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface HttpManager : AFHTTPSessionManager

+ (HttpManager *)sharedManager;

+ (void )get:(NSString *)url parameter:(id)parameters success:(void (^)(id responseObject))success faliure:(void (^)(id error))failure;

+ (void)post:(NSString *)url parameters:(id)parameters success:(void(^)(id responseObject))success faliure:(void(^)(id error))failure;

@end


NSDictionary *parameter = @{@"format":@"json",
                            @"ip":@""};
//    NSString *url = @"http://int.dpool.sina.com.cn/iplookup/iplookup.php";
NSString *url = @"http://e.dangdang.com/media/api.go?action=column&columnType=all_benzhouzhuti&isFull=1&returnType=json&channelId=10020&serverVersionNo=1.0&deviceSerialNo=9EAF67C2-6A7C-400D-B9A2-5F6A95C66334&orderSource=30000&deviceType=iphone&fromPlatform=101&platformSource=DDDS-P&clientVersionNo=5.7.0&permanentId=20160609140513100116807875249950073&token=75720997161270bdeaf3471313ae78a0&macAddr=020000000000&platform=2&resolution=640x960&clientOs=iPhone%20OS7.1&start=0&end=19";
[HttpManager get:url parameter:nil success:^(id responseObject) {
    
    NSLog(@"%@",responseObject[@"data"][@"saleList"]);
    NSArray *arr = responseObject[@"data"][@"saleList"];
    self.dataSource = arr;
    [self.tableView reloadData];
} faliure:^(id error) {
    NSLog(@"%@",error);
}];
