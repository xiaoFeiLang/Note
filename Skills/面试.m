//
//  面试.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>
面试
1.Frame Bounds 区别
2.写出UITableView 以及 UIButton 到NSObject的继承列表
3.KVO是什么，内部是怎么实现的？
4.block在ARC和传统的MRC的行为和用法有没有什么区别，需要注意什么？
5.是否用过CoreText，简述富文本实现原理
6.简述Objective－C的运行时机制原理
7.从哪些方面去做SQLige数据库的优化
8.从哪些方面去做app的优化
9.怎么搭app框架？
10.利用NSOperaiton与NSOperationQueue处理多线程时，有3个NSOperation分别为A，B，C，要求A，B执行完之后，才执行C，如何做？

get post
GET的请求参数在URL中，而POST的请求参数是二进制数据，并不放在URL中，而是单独的一个包
服务器访问日志里面get会完全暴露请求体
GET方法是可以做缓存的，可以取出来做分析
而POST在没有分析请求体的二进制文件之前无法知道用户的隐私信息，而且无法做缓存

* assign： 简单赋值，不更改索引计数（Reference Counting）。
* copy： 建立一个索引计数为1的对象，然后释放旧对象
* retain：释放旧的对象，将旧对象的值赋予输入对象，再提高输入对象的索引计数为1
retain的实际语法为：
- (void)setName:(NSString *)newName {
    if (name != newName) {
        [name release];
        name = [newName retain];
        // name’s retain count has been bumped up by 1
    }
}
* 		•	使用assign: 对基础数据类型 （NSInteger，CGFloat）和C数据类型（int, float, double, char, 等等）delegate
* 使用copy： 对NSString
* 使用retain： 对其他NSObject和其子类	nonatomic关键字：
atomic是Objc使用的一种线程保护技术，基本上来讲，是防止在写未完成的时候被另外一个线程读取，造成数据错误。而这种机制是耗费系统资源的，所以在iPhone这种小型设备上，如果没有使用多线程间的通讯编程，那么nonatomic是一个非常好的选择。

copy是重新创建一个对象相对于strong更加安全，内容不会被串改。用strong只是复制地址retaincount+1。内容可能会被改


六、总结：
线程与进程的区别和联系?
* 一个程序至少有一个进程,一个进程至少有一个线程:2
* 进程:一个程序的一次运行,在执行过程中拥有独立的内存单元,而多个线程共享一块内存线程:线程是指进程内的一个执行单元。

* 联系:线程是进程的基本组成单位

* 区别:
* 1.调度:线程作为调度和分配的基本单位,进程作为拥有资源的基本单位
* 2.并发性:不仅进程之间可以并发执行,同一个进程的多个线程之间也可并发执行
* 3.拥有资源:进程是拥有资源的一个独立单位,线程不拥有系统资源,但可以访问隶属于进程的资源.
* 4.系统开销:在创建或撤消进程时,由于系统都要为之分配和回收资源,导致系统的开销明显大于创建
或撤消线程时的开销。
多线程的安全隐患 :
* 资源共享
* 1块资源可能会被多个线程共享，也就是多个线程可能会访问同一块资源
* 比如多个线程访问同一个对象、同一个变量、同一个文件
* 当多个线程访问同一块资源时，很容易引发数据错乱和数据安全问题

多线程同步和异步的区别？，iOS 中如何实现多线程的同步?
* 同步 : 是指一个线程要等待上一个线程执行完之后才开始执行当前的线程
* 异步：线程间没有先后，一个线程不用等某一个线程执行后才可以执行

* 多线程的同步实现多种方式
* 关键字@synchronized()
* NSOperationQueue:maxcurrentcount
* NSConditionLock
