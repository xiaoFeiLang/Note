//
//  Block.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>
NSGlobalBlock：类似函数，位于text段；
NSStackBlock：位于栈内存，函数返回后Block将无效；
NSMallocBlock：位于堆内存。

Block不仅 实现函数的功能，还能携带函数的执行环境。

/* 回传void ，含有10 个block 的阵列，每个block 都有一个型态为整数的参数*/

void (^arrayOfTenBlocksReturningVoidWinIntArgument[ 10 ])( int );

//***************************************************  block作为方法的参数  ************************************************************
在SDK中提供了许多使用block的方法，我们可以像传递一般参数的方式来传递block，下面这个范例示范如何在一个阵列的前5笔资料中取出我们想要的资料的索引值：

NSArray *array = [ NSArray arrayWithObjects : @"A" , @"B" , @"C" , @"A" , @"B" , @"Z" , @"G" , @"are" , @" Q" ,nil ];

NSSet *filterSet = [ NSSet setWithObjects : @"A" , @"B" , @"Z" , @"Q" , nil ];

BOOL (^test)( id obj, NSUInteger idx, BOOL *stop);

test = ^ ( id obj, NSUInteger idx, BOOL *stop) {
    
  // 只对前5 笔资料做检查
    
   if (idx < 5 ) {
        
       if ([filterSet containsObject : obj]) {
            
             return YES ;
                    }
        
               }
    
    return NO ;
    
    };

NSIndexSet *indexes = [array indexesOfObjectsPassingTest :test];

NSLog ( @"indexes: %@" , indexes);
//***************************************************   end   ************************************************************

