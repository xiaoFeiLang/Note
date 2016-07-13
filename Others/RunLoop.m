//
//  RunLoop.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>
RunLoop

每条线程都有唯一的一个与之对应的RunLoop对象
RunLoop在第一次获取时创建，在线程结束时销毁

CFRunLoopGetMain();
CFRunLoopGetCurrent();
[NSRunLoop mainRunLoop];
[NSRunLoop currentRunLoop];

CFRunLoopRef
CFRunLoopModeRef：NSDefaultRunLoopMode，UITrackingRunLoopMode，UIInitializationRunLoopMode，
GSEventReceiveRunLoopMode，NSRunLoopCommonModes
CFRunLoopSourceRef
CFRunLoopTimerRef
CFRunLoopObserverRef

Mode
Source
Observer
Timer

//    CFRunLoopObserverRef *objRef = CFRunLoopObserverCreate(<#CFAllocatorRef allocator#>, <#CFOptionFlags activities#>, <#Boolean repeats#>, <#CFIndex order#>, <#CFRunLoopObserverCallBack callout#>, <#CFRunLoopObserverContext *context#>)
//    CFRunLoopAddObserver(<#CFRunLoopRef rl#>, <#CFRunLoopObserverRef observer#>, <#CFStringRef mode#>)
//    CFRelease();
