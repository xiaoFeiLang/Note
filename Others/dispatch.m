//
//  dispatch.m
//  Note
//
//  Created by Loulou on 16/7/21.
//
//

#import <Foundation/Foundation.h>
//***************************************************  start  ************************************************************
dispatch_apply(size_t iterations, dispatch_queue_t queue, void (^block)( size_t ));

这个函数将一个block提交到发送伫列（dispatch queue）中来执行 多重的呼叫，只有当伫列中的工作都执行完成后才会回传，这个函数拥有三个变数，而最后一个参数就是block ，请参考下面的范例：

size_t count = 10 ;

dispatch_queue_t queue =

dispatch_get_global_queue ( DISPATCH_QUEUE_PRIORITY_DEFAULT , 0 );

dispatch_apply (count, queue, ^( size_t i) {
    
    printf ( "%u\n" , i);
    
});
//***************************************************   end   ************************************************************


