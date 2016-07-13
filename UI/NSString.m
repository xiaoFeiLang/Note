//
//  NSString.m
//  Note
//
//  Created by loulou on 16/6/29.
//
//

#import <Foundation/Foundation.h>

http://blog.csdn.net/ys410900345/article/details/25976179
1.NSKernAttributeName: @10 调整字句 kerning 字句调整
2.NSFontAttributeName : [UIFont systemFontOfSize:_fontSize] 设置字体
3.NSForegroundColorAttributeName :[UIColor redColor] 设置文字颜色
4.NSParagraphStyleAttributeName : paragraph 设置段落样式
5.NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
paragraph.alignment = NSTextAlignmentCenter;
6.NSBackgroundColorAttributeName: [UIColor blackColor] 设置背景颜色
7.NSStrokeColorAttributeName设置文字描边颜色，需要和NSStrokeWidthAttributeName设置描边宽度，这样就能使文字空心.