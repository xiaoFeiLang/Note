//
//  Temp.m
//  Note
//
//  Created by loulou on 16/6/29.
//
//

#import <Foundation/Foundation.h>
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        <#code to be executed after a specified delay#>
//    });
//dispatch_group_async(<#dispatch_group_t group#>, <#dispatch_queue_t queue#>, <#^(void)block#>)
//    dispatch_group_notify(<#dispatch_group_t group#>, <#dispatch_queue_t queue#>, <#^(void)block#>)
//    dispatch_semaphore_wait(<#dispatch_semaphore_t dsema#>, <#dispatch_time_t timeout#>)
//    dispatch_semaphore_signal(<#dispatch_semaphore_t dsema#>)
//

dispatch_queue_t global_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
////    操作1完成了操作2才开始
//    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
//    dispatch_async(global_queue, ^{
//        NSLog(@"1－－－－－－");
//        [NSThread sleepForTimeInterval:3.0];
//        NSLog(@"1");
////        发信号，信号量＋1 如果＋1前信号量小于0，直接唤醒
//        dispatch_semaphore_signal(sema);
//    });
//
//    dispatch_async(global_queue, ^{
////        信号量－1，如果－1后小于0，则等待参数2那么长时间
//        NSLog(@"2-－－－－");
//        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
//        [NSThread sleepForTimeInterval:5.0];
//        NSLog(@"2");
//    });

////    信号量实现 线程同步  控制并发数量
//    dispatch_semaphore_t sema2 = dispatch_semaphore_create(5);
//    for (int i = 0; i < 100; i++) {
//        dispatch_async(global_queue, ^{
//            dispatch_semaphore_wait(sema2, DISPATCH_TIME_FOREVER);
//            NSLog(@"start");
//            [NSThread sleepForTimeInterval:3];
//             dispatch_semaphore_signal(sema2);
//            NSLog(@"stop");
//        });
//
//    }

static dispatch_once_t onceToken;
dispatch_once(&onceToken, ^{
    NSLog(@"only one");
});

//    局部变量默认不初始化

dispatch_queue_t current_queue = dispatch_queue_create("", DISPATCH_QUEUE_CONCURRENT);

//    for 循环不要求顺序的话 可以这样处理   放到其他队列里(并发计算)

dispatch_async(current_queue, ^{
    
    dispatch_apply(10, global_queue, ^(size_t idx) {
        NSLog(@"%zu",idx);
    });
    
});
dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 7);
dispatch_after(time, global_queue, ^{
    NSLog(@"10101010101");
});

//    开辟线程的方法
//NSThread detachNewThreadSelector:<#(nonnull SEL)#> toTarget:<#(nonnull id)#> withObject:<#(nullable id)#>
//    thread initWithTarget:<#(nonnull id)#> selector:<#(nonnull SEL)#> object:<#(nullable id)#>

//    thread performSelector:<#(SEL)#> withObject:<#(id)#>

//    回到主线程
//    thread performSelectorOnMainThread:<#(nonnull SEL)#> withObject:<#(nullable id)#> waitUntilDone:<#(BOOL)#>
//    thread performSelectorOnMainThread:<#(nonnull SEL)#> withObject:<#(nullable id)#> waitUntilDone:<#(BOOL)#> modes:<#(nullable NSArray<NSString *> *)#>


//    __weak typeof(self)weakSelf = self;
//    id __weak weakSelf = self;
//    id __block blockSelf = self;
//    __weak __typeof(&*self) typeofSelf = self;

//    block 内部修改外部变量
__block int a = 0;
void (^change)(void) = ^{
    a = 99;
};
change();
NSLog(@"%ld",a);

[[NSOperationQueue mainQueue] addOperationWithBlock:^{
    
}];
[[NSNotificationCenter defaultCenter] addObserverForName:@"" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
    
}];
