
//  Created by aJun on 16/5/17.
//  Copyright © 2016年 aJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdvertisingScrollView : UIView

- (void)setAnimationDuration:(NSTimeInterval)newVar;

- (instancetype)initWithMinFrame:(CGRect)frame;

- (void)initializationUIWithDataArray:(NSArray *)dataArray;
@end


//***************************************************  start  ************************************************************


- (AdvertisingScrollView *)scrollView{
    
    if (_scrollView == nil) {
        NSArray *imagsArray = @[@"01",@"02",@"03",@"04",];
        _scrollView = [[AdvertisingScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width ,180)];
        [_scrollView initializationUIWithDataArray:imagsArray];
        self.tableView.tableHeaderView = _scrollView;
        
    }
    return _scrollView;
}

viewDidload
[self.scrollView setAnimationDuration:1.5];

//***************************************************   end   ************************************************************
