//
//  照相机.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>

照相机

图片存到沙盒
NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
        NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"pic_%d.png", myI]];   // 保存文件的名称
        [UIImagePNGRepresentation(myImage)writeToFile: filePath    atomically:YES];


在plist保存路径
NSMutableDictionary *info = [[NSMutableDictionary alloc]init];
 
NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
 
NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"pic_%d.png", conut_]];   // 保存文件的名称
 
[info setObject:filePath forKey:@"img"];
[specialArr addObject:info];

使用图片
NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"pic_%d.png", (int)current]];   // 保存文件的名称
UIImage *img = [UIImage imageWithContentsOfFile:filePath];

