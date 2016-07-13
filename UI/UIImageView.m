//
//  UIImageView.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>


//1、首先对image付值
cell.imageView.image=[UIImage imageNamed:@"灰时间"];
//2、调整大小
CGSize itemSize = CGSizeMake(40, 40);
UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
[cell.imageView.image drawInRect:imageRect];
cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
UIGraphicsEndImageContext();
