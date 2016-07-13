//
//  UINavgation.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>

导航栏

透明
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    [self createCustomNavigationBackOrOtherButton];
}


//全透明，一般在viewWillAppear
- (void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil
                                                  forBarMetrics:UIBarMetricsDefault];
}

//自定义返回按钮
- (void)createCustomNavigationBackOrOtherButton
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 32, 32);
    [backBtn addTarget:self action:@selector(navCustomBackButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:[UIImage imageNamed:@"orderprocess_icon_submit_red"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    // self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NavBackCustomImg"] style:UIBarButtonItemStyleBordered target:self action:@selector(navCustomBackButtonPressed)];
    //解决自定义了leftBarbuttonItem左滑返回手势失效了的问题
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
}

- (void)navCustomBackButtonPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}


//上滑改变透明度
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    self.navigationController.navigationBar.alpha = scrollView.contentOffset.y / 100;
}

//26，如何隐藏UINavigationBar

有的时候，我们的视图使用了Navigation Controller ，但是主界面（rootviewcontroller）或其它push进入的界面 想使用一个全屏的view，就是说，不显示顶部的navigationBar，这个时候，就需要我们来隐藏了。
//隐藏NavigationBar
-(void) viewWillAppear:(BOOL)animated{
    
    [self.navigationControllersetNavigationBarHidden:YESanimated:YES]; //设置隐藏
    [super viewWillAppear:animated];
}
-(void) viewWillDisappear:(BOOL)animated{
    
    [self.navigationControllersetNavigationBarHidden:NOanimated:YES];
    [super viewWillDisappear:animated];
    
}
