//
//  LTabBarController.m
//  AFNetTest
//
//  Created by loulou on 16/6/9.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import "LTabBarController.h"
#import "LTabBar.h"
#import "ViewController.h"
#import "BookStoreVC.h"
#import "ReadVC.h"
#import "MySelfVC.h"
@interface LTabBarController ()

@end

@implementation LTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildVC];
    
    [self setupTabBar];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupChildVC{

    
    
    ViewController *vc2 = [[ViewController alloc] init];
    [self childVC:vc2 imageName:nil selectedImage:nil withTitle:@"书城"];
    
    
    BookStoreVC *vc3 = [[BookStoreVC alloc] init];
    [self childVC:vc3 imageName:nil selectedImage:nil withTitle:@"书架"];
    
    ViewController *vc1 = [[ViewController alloc] init];
    [self childVC:vc1 imageName:nil selectedImage:nil withTitle:@"导读"];
    
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    [self childVC:vc4 imageName:nil selectedImage:nil withTitle:@"发现"];
    
    MySelfVC *vc5 = [[MySelfVC alloc] init];
    [self childVC:vc5 imageName:nil selectedImage:nil withTitle:@"我的"];

}

- (void)childVC:(UIViewController *)vc imageName:(NSString *)imageName selectedImage:(NSString *)selectedImage withTitle:(NSString *)title{

    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.tabBarItem.image = [UIImage imageNamed:imageName];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    nav.tabBarItem.title = title;
    [self addChildViewController:nav];
}

- (void)setupTabBar{

    [self setValue:[[LTabBar alloc] init] forKey:@"tabBar"];
    self.tabBar.tintColor = [UIColor whiteColor];
    self.tabBar.barTintColor = [UIColor blackColor];
}
@end
