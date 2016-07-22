//
//  UITableView.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>
self.navigationController.navigationBar.alpha = scrollView.contentOffset.y / 100;
//1. 解决UITableView分割线距左边有距离的问题

我们在使用tableview时会发现分割线的左边会短一些，通常可以使用setSeparatorInset:UIEdgeInsetsZero 来解决。但是升级到XCode6之后，在iOS8里发现没有效果。下面给出解决办法：
首先在viewDidLoad方法中加上如下代码：

if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
    
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    
}

if ([self.tableView     respondsToSelector:@selector(setLayoutMargins:)]) {
    
    [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    
}
然后在willDisplayCell方法中加入如下代码：

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [cell setSeparatorInset:UIEdgeInsetsZero];
        
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [cell setLayoutMargins:UIEdgeInsetsZero];
        
    }
    
}

//2. 点击cell上的Button获取cell的位置 (三种方法: tag, superView, block, 根据需求各自使用)

*
*
* 方法一: 利用superView获取
* // 自定义cell: TestCell
* TestCell *cell = [(TestCell *)[button superview] superview];
* NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
* NSLog(@"indexPath is = %li",(long)indexPath.row);
*
*
* 方法二: 通过Block来获取
*

在自定义cell的.h文件
#import <UIKit/UIKit.h>

typedef void(^BlockButton)(UIButton *button);


@interface TestCell : UITableViewCell


@property (nonatomic, strong) UIButton *button;

@property (nonatomic, copy) BlockButton buttonBlock;

- (void)handlerButtonAction:(BlockButton)block;


@end

＊方法三：通过点击位置获取

- (IBAction)cellButtonTapped:(id)sender {
    UIButton *button = sender;
    CGPoint correctedPoint =
    [button convertPoint:button.bounds.origin toView:self.tableView];
    NSIndexPath *indexPath =
    [self.tableView indexPathForRowAtPoint:correctedPoint];
    NSLog(@"Button tapped in row %d", indexPath.row);
}

在自定义cell的.m文件
#import "TestCell.h"

@implementation TestCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self p_setupSubviews];
    }
    return self;
}



- (void)p_setupSubviews
{
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(self.frame.size.width-150, 10, 100, self.frame.size.height - 20);
    self.button.backgroundColor = [UIColor cyanColor];
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.button];
}



- (void)buttonAction:(UIButton *)button
{
    if (self.buttonBlock) {
        self.buttonBlock(button);
    }
}



- (void)handlerButtonAction:(BlockButton)block
{
    self.buttonBlock = block;
}

@end
在ViewController.m中
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"test";
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[TestCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
    }
    
    [cell.button setTitle:[NSString stringWithFormat:@"%ld", (long)indexPath.row] forState:UIControlStateNormal];
    
    [cell handlerButtonAction:^(UIButton *button) {
        NSLog(@"=======   %ld", (long)indexPath.row);
        [cell.button setTitle:@"OK!" forState:UIControlStateNormal];
        
    }];
    return cell;
}

//3. 改变点击cell时cell的颜色
// 利用selectedBackgroundView方法

UIView *aView = [[UIView alloc] initWithFrame:cell.contentView.frame];
aView.backgroundColor = [UIColor colorWithRed:155/255.0 green:34/255.0 blue:63/255.0 alpha:1.0];
cell.selectedBackgroundView = aView;

//4. cell的自适应
// cell的高度问题, 都在这个方法中写
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 1. 取数据
    
    NSString *name = [self.arr objectAtIndex:indexPath.row];
    
    // 2. 通过字符串的内容, 计算在一定宽度下, 文本占用的高度;
    
    NSDictionary *dic = @{NSFontAttributeName: [UIFont systemFontOfSize:17]};
    
    // 参数1: 通过CGSize给定一个宽度, 用来计算
    // 参数2: 通过以一个行为矩形, 计算高度
    // 参数3: 字体大小
    CGRect rect = [name boundingRectWithSize:CGSizeMake(tableView.frame.size.width, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    return rect.size.height;
}

6. 调整cell的间距
 在tableView样式为group时
 // 创建一个UITableViewCell的子类，重写setfrme方法

 -(void)setFrame:(CGRect)frame
  {
    *      frame.origin.y -= 5;
    *      frame.size.height -= 10;
    *      [super setFrame:frame];
    *  }
*

注意: 上面的方法有待验证!
第二种方法是, 把cell的backgroundColor设置为灰色, 在cell上加一个白色的view,
让view的height比cell的height少一点(cell需要空出来的距离)就可以了. 但是自己感觉这个方法有点low啊,
大家要是有什么好方法, 还望不吝赐教哦.

//7. UITableView的section
*
* 当tableview样式为plain时, section需要自己设定大小, 而且section默认是不会随着tableview滚动的.
* 当tableview样式为group时, section是自带的, section是跟随tableview滚动的


//***************************************************  start  ************************************************************

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
        CGFloat sectionHeaderHeight = 26;//设置你footer高度
            if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
                    scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
                } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
                        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
                    }
        
} 


//***************************************************   end   ************************************************************

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if (self.textView.text.length == 0){
        
        if ([text isEqualToString:@""]) {
            
            self.placeholder.hidden = NO;
            
        } else {
            
            self.placeholder.hidden = YES;
            
        }
        
    } else {
        
        if (self.textView.text.length == 1) {
            
            if ([text isEqualToString:@""]) {
                
                self.placeholder.hidden = NO;
                
            } else {
                
                self.placeholder.hidden = YES;
            }
        } else {
            
            self.placeholder.hidden = YES;
        }
    }
    return YES;

