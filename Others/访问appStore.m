//
//  访问appStore.m
//  Note
//
//  Created by loulou on 16/6/29.
//
//

#import <Foundation/Foundation.h>

//以下是通过appstore链接到自己应用在商店的位置
NSString *url = [NSString stringWithFormat:@"http://itunes.apple.com/cn/app/huo-xing-she-xin-dian/id549425594?l=en&mt=8"];
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];