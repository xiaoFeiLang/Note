//
//  LoopScollView.h
//  InfiniteLoop
//
//  Created by yumlive0909 on 15/9/9.
//  Copyright (c) 2015年 yumlive0909. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol LoopScollViewDelegate <NSObject>

/**点击了滚动图*/
- (void)tapScrollPicture:(int)pictureTag;

@end


@interface LoopScollView : UIView

@property (nonatomic,weak)id<LoopScollViewDelegate> delegate;

/**传进图片数组*/
- (void)setPictureArray:(NSMutableArray *)picArr;


@end



//***************************************************  use  ************************************************************

- (NSMutableArray *)imgPathArr
{
    if (_imgPathArr == nil) {
        _imgPathArr = [[NSMutableArray alloc] initWithObjects:@"http://www.blisscake.cn/Upload/Product/Show/Source/ps_1507201119031647109.jpg",@"http://www.blisscake.cn/Upload/Product/Show/Source/ps_1507201119031647109.jpg",@"http://www.blisscake.cn/Upload/Product/Show/Source/ps_1507201119031647109.jpg",@"http://www.blisscake.cn/Upload/Product/Show/Source/ps_1507201119031647109.jpg",nil];
    }
    return _imgPathArr;
}

- (LoopScollView *)loopScrollView
{
    if (_loopScrollView == nil) {
        _loopScrollView = [[LoopScollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
        _loopScrollView.delegate = self;
        self.tableView.tableHeaderView = _loopScrollView;
    }
    return _loopScrollView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.clearsSelectionOnViewWillAppear = NO;
    
    [self.loopScrollView setPictureArray:self.imgPathArr];
    
}


//***************************************************   end   ************************************************************
