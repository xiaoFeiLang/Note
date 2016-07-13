//
//  LTabBar.m
//  AFNetTest
//
//  Created by loulou on 16/6/9.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import "LTabBar.h"
#import "UIView+frame.h"

@implementation LTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
    
        
    }
    return self;
}
- (UIImage *)addImage:(UIImage *)image selImage:(UIImage *)selImage withSize:(CGSize)size{
    
    UIGraphicsBeginImageContext(size);
    [image drawInRect:(CGRect){{0,0},size}];
    [selImage drawInRect:CGRectMake(10, 101, size.width - 20, size.height - 20)];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

- (void)layoutSubviews{

    [super layoutSubviews];
    CGFloat h = self.frame.size.height;
    CGFloat bottonH = h;
    CGFloat bottonW = screenW / 5;
    CGFloat bottonY = 0;
    CGFloat bottonX = 0;
    
    int index = 0;
    for (UIView *view in self.subviews) {
        if (![NSStringFromClass(view.class) isEqualToString:@"UITabBarButton"]) continue;
        bottonX = index * bottonW;
        view.frame = CGRectMake(bottonX, bottonY, bottonW, bottonH);
        index ++;
    }
    
}
@end
