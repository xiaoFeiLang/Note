//
//  LoopScollView.m
//  InfiniteLoop
//
//  Created by yumlive0909 on 15/9/9.
//  Copyright (c) 2015年 yumlive0909. All rights reserved.
//

#import "LoopScollView.h"
#import "UIImageView+WebCache.h"

#define PageCtlWidth  40
#define PageCtlHeight 20

@interface LoopScollView ()<UIScrollViewDelegate>

@property (nonatomic,assign)int scrollPageCount;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)NSArray *myPicArr;
@property (nonatomic,strong)UIScrollView *pictureScrollView;
@property (nonatomic,strong)UIPageControl *pageControl;

@end



@implementation LoopScollView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.scrollPageCount = 0;
        [self pictureScrollView];
    }
    return self;
}


- (UIScrollView *)pictureScrollView
{
    if (_pictureScrollView == nil) {
        _pictureScrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        _pictureScrollView.pagingEnabled = YES;
        _pictureScrollView.showsHorizontalScrollIndicator = NO;
        _pictureScrollView.showsVerticalScrollIndicator = NO;
        _pictureScrollView.bounces = NO;
        _pictureScrollView.delegate =self;
        [self addSubview:_pictureScrollView];
    }
    return _pictureScrollView;
}

-(UIPageControl *)pageControl
{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(self.bounds.size.width - PageCtlWidth, self.bounds.size.height - PageCtlHeight, PageCtlWidth, PageCtlHeight)];
        _pageControl.numberOfPages = self.myPicArr.count;
        _pageControl.pageIndicatorTintColor = [UIColor darkGrayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
        [self addSubview:_pageControl];
    }
    return _pageControl;
}

- (void)setPictureArray:(NSMutableArray *)picArr
{
    self.myPicArr = [NSArray arrayWithArray:picArr];
    
    //轮播图不为0时
    if ( [self.myPicArr count] > 0)
    {
        [self pageControl];
        
        self.pictureScrollView.contentSize = CGSizeMake(self.bounds.size.width * (self.myPicArr.count + 2), self.bounds.size.height);
        
        for (int i = 0; i < (self.myPicArr.count + 2); i++)
        {
            UIImageView *singlePicture = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width * i, 0, self.bounds.size.width, self.bounds.size.height)];
            singlePicture.contentMode = UIViewContentModeScaleAspectFill;
            singlePicture.clipsToBounds = YES;
            
            if (i == 0)
            {
                NSString *imgUrl = [self.myPicArr lastObject];
                //如果传进来的是Model数组，在此取出model里图片的地址
                [singlePicture sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
                singlePicture.tag = self.myPicArr.count - 1;
            }
            else if (i == self.myPicArr.count + 1)
            {
                NSString *imgUrl = [self.myPicArr firstObject];
                //如果传进来的是Model数组，在此取出model里图片的地址
                [singlePicture sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
                singlePicture.tag = 0;
            }
            else
            {
                NSString *imgUrl = self.myPicArr[i - 1];
                //如果传进来的是Model数组，在此取出model里图片的地址
                [singlePicture sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
                singlePicture.tag = i - 1;
            }
            
            //设置触动手势
            singlePicture.userInteractionEnabled = YES;
            UITapGestureRecognizer *imgTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapPicAction:)];
            [singlePicture addGestureRecognizer:imgTap];
            
            [self.pictureScrollView addSubview:singlePicture];
        }
        
        //第一张
        self.pictureScrollView.contentOffset = CGPointMake(self.pictureScrollView.bounds.size.width, 0);
        
        //启动定时器
        [self startTimer];
    }
    
}

- (void)tapPicAction:(UIGestureRecognizer *)gest
{
    // 取出model : [self.myPicArr objectAtIndex:gest.view.tag]
    if ([self.delegate respondsToSelector:@selector(tapScrollPicture:)]) {
        [self.delegate tapScrollPicture:(int)gest.view.tag];
    }
}


#pragma mark - 定时器滚动轮播图
-(void)nextPage
{
    if (self.scrollPageCount >= self.myPicArr.count)
    {
        self.scrollPageCount = 0;
    }
    self.scrollPageCount ++;
    [self.pictureScrollView setContentOffset:CGPointMake(self.bounds.size.width * self.scrollPageCount, 0) animated:YES];
    self.pageControl.currentPage = self.scrollPageCount - 1;
    
}

#pragma mark - scrollView
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //偏离位置
    if (scrollView.contentOffset.x == 0)
    {
        self.pictureScrollView.contentOffset = CGPointMake(self.bounds.size.width * self.myPicArr.count, 0);
    }
    else if(scrollView.contentOffset.x == self.bounds.size.width * (self.myPicArr.count + 1) )
    {
        self.pictureScrollView.contentOffset = CGPointMake(self.bounds.size.width, 0);
    }
    
    //小圆点
    int currentPage = scrollView.contentOffset.x / self.bounds.size.width;
    if (currentPage == 0)
    {
        self.pageControl.currentPage = self.myPicArr.count - 1;
    }
    else if(currentPage == self.myPicArr.count + 1)
    {
        self.pageControl.currentPage = 0;
    }
    else
    {
        self.pageControl.currentPage = currentPage - 1;
    }
}

/**用户将要开始拖拽的时候调用*/
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //停止定时器
    [self stopTimer:self.timer];
}

/**用户将要停止拖拽的时候调用*/
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //开始定时器
    [self startTimer];
}


#pragma mark - 定时器相关
/**添加一个定时器*/
- (void)startTimer
{
    self.timer = [NSTimer timerWithTimeInterval:2.0f target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

/** 停止定时器，并将定时器清空(因为一旦定时器被停止,就不能再次被使用,所以停止之后立即清空)*/
- (void)stopTimer:(NSTimer *)timer
{
    [timer invalidate];
    timer = nil;
}
@end
