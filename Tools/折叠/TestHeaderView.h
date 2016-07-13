//
//  TestHeaderView.h
//  CanFoldTableView
//
//  Created by loulou on 16/6/29.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickHeader)(NSInteger);

@interface TestHeaderView : UITableViewHeaderFooterView

@property (nonatomic, assign) BOOL isOpen;
@property (nonatomic, strong) UILabel *label_Title;
@property (nonatomic, copy) clickHeader clickHeaderBlock;
@property (nonatomic, assign) NSInteger section;

+ (instancetype)headerView:(UITableView *)tableView;
@end
