//
//  TestHeaderView.m
//  CanFoldTableView
//
//  Created by loulou on 16/6/29.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import "TestHeaderView.h"
@interface TestHeaderView ()



@end
@implementation TestHeaderView

+ (instancetype)headerView:(UITableView *)tableView{

    static NSString *identifier = @"header";
    TestHeaderView *header = (TestHeaderView *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!header) {
        header = [[TestHeaderView alloc] initWithReuseIdentifier:identifier];
    }
    return header;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.label_Title = [[UILabel alloc] initWithFrame:CGRectMake(120, 10, 320, 40)];
        self.label_Title.text = @"Title";
        [self addSubview:self.label_Title];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickHeader:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)clickHeader:(UITapGestureRecognizer *)sender{

    if (self.clickHeaderBlock) {
        self.clickHeaderBlock(self.section);
    }
}

- (void)setIsOpen:(BOOL)isOpen{

    if (isOpen) {
        NSLog(@"isOpen");
    } else {
        NSLog(@"not Open");
    }
}
@end
