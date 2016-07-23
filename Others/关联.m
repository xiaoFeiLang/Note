//
//  关联.m
//  Note
//
//  Created by Loulou on 16/7/18.
//
//

#import <Foundation/Foundation.h>

int main(int argc, const char* argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool] alloc init];
    
    static char overviewKey;
    NSArray *array =[[NSArray alloc] initWidthObjects:@"One", @"Two", @"Three", nil];
    //为了演示的目的，这里使用initWithFormat:来确保字符串可以被销毁
    NSString * overview = [[NSString alloc] initWithFormat:@"@",@"First three numbers"];
    objc_setAssociatedObject(array, &overviewKey, overview, OBJC_ASSOCIATION_RETAIN);
    [overview release];
    
    NSString *associatedObject = (NSString *)objc_getAssociatedObject(arrray, &overviewKey);
    NSLog(@"associatedObject:%@", associatedObject);
    
    objc_setAssociatedObject(array, &overviewKey, nil, OBJC_ASSOCIATION_ASSIGN);
    [array release];
    
    [pool drain];
    return 0;
}