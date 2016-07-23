//
//  比较.m
//  Note
//
//  Created by Loulou on 16/7/18.
//
//

#import <Foundation/Foundation.h>

if (str1!=nil && [str1 compare:@"some text"] == NSOrderedSame) {
    // Do something
}
else {
    // Do something else
}

isEqualToString /注意此方法是比较字符串指针向的值，而“==”比较的是指针值。

NSArray* arr = [NSArray arrayWithObjects:
                @"Manny",
                @"Moe",
                @"Jack",
                nil];

//***************************************************  start  ************************************************************
NSOrderedAscending的意思是：左边的操作对象小于右边的对象。
NSOrderedDescending的意思是：左边的操作对象大于右边的对象。

NSComparisonResult (^sortByLastCharacter)(id, id) = ^(id obj1, id obj2) {
    NSString* s1 = (NSString*) obj1;
    NSString* s2 = (NSString*) obj2;
    NSString* string1end = [s1 substringFromIndex:[s1 length] - 1];
    NSString* string2end = [s2 substringFromIndex:[s2 length] - 1];
    return [string1end compare:string2end];
};

NSArray* arr2 = [arr sortedArrayUsingComparator: sortByLastCharacter];
NSLog(@"%@", arr2);
//***************************************************   end   ************************************************************
