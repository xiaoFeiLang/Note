//
//  ViewController.m
//  CanFoldTableView
//
//  Created by loulou on 16/6/29.
//  Copyright © 2016年 qxb. All rights reserved.
//

#import "ViewController.h"
#import "TestHeaderView.h"

@interface ViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableDictionary *dic;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.dic = [NSMutableDictionary dictionary];
}

- (void)setupTableView{

    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    [self.view addSubview:self.tableView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSString *key = [NSString stringWithFormat:@"%d", (int)section];
    BOOL folded = [[self.dic objectForKey:key] boolValue];
    
    return folded ? 10 : 0;

}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = @"ssss";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 60;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    TestHeaderView *headerView = [TestHeaderView headerView:tableView];
    headerView.section = section;
    __weak typeof(self)weakSelf = self;
    headerView.clickHeaderBlock = ^(NSInteger selectSection){
    
        [weakSelf clickHeaderView:selectSection];
    };
    
    NSString *key = [NSString stringWithFormat:@"%d", (int)section];
    BOOL folded = [[self.dic valueForKey:key] boolValue];
    
    headerView.isOpen = folded;
    
    return headerView;
}

-(void)clickHeaderView:(NSInteger)selectSection{

    NSString *key = [NSString stringWithFormat:@"%d",(int)selectSection];
    BOOL folded = [[self.dic objectForKey:key] boolValue];
    NSString *fold = folded ? @"0" : @"1";
    [self.dic setValue:fold forKey:key];
    
    NSIndexSet *set = [NSIndexSet indexSetWithIndex:selectSection];
    [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationFade];

}

@end
