//
//  轮播.m
//  Note
//
//  Created by loulou on 16/7/3.
//
//

#import <Foundation/Foundation.h>

#import "SDCycleScrollView.h"
@interface ViewController ()<SDCycleScrollViewDelegate>
写了两个方法分别实现本地图片和网络图片的加载
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    //加载本地图片
    [self LocalPhoto];
    //加载网络图片
    //    [self urlPhoto];
}
//加载本地图片实现轮播图
- (void)LocalPhoto
{
    //本地图片
    NSArray * images = @[@"0",@"1",@"2",@"3",@"5"];
    
    //创建图片轮播
    SDCycleScrollView * cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:self.view.bounds imageNamesGroup:images];
    cycleScrollView.delegate = self;
    //分页控件位置
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    //是否无限循环
    //    cycleScrollView.infiniteLoop = NO;
    //是否自动滚动
    cycleScrollView.autoScroll =YES;
    //轮播时间间隔
    // cycleScrollView.autoScrollTimeInterval = 3.0;
    [self.view addSubview:cycleScrollView];
    
    
}

//网络图片
- (void)urlPhoto
{
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    
    SDCycleScrollView * cycleScrollView2 =[SDCycleScrollView cycleScrollViewWithFrame:self.view.bounds delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    cycleScrollView2.currentPageDotColor = [UIColor yellowColor]; // 自定义分页控件小圆标颜色
    cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    //加载网络图片
    [self.view addSubview:cycleScrollView2];
}
//点击图片方法
#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"%ld",(long)index);
}

文／少侠你好（简书作者）
原文链接：http://www.jianshu.com/p/72cf18c94c0d
著作权归作者所有，转载请联系作者获得授权，并标注“简书作者”。