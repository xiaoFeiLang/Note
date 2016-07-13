//
//  Delegation.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>
代理协议

//定义一个协议.h
@protocol ViewControllerDelegate<NSObject>
- (void)selfDelegateMethod;
@end

//本类实现这个协议ViewControllerDelegate
@interface ViewController ()<ViewControllerDelegate>
@property (nonatomic, assign) id<ViewControllerDelegate> delegate;

@end
.m

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.delegate = self;
    if (self.delegate && [self.delegate respondsToSelector:@selector(selfDelegateMethod)]) {
        [self.delegate selfDelegateMethod];
    }
}


#pragma mark - ViewControllerDelegate method
//实现协议中的方法
- (void)selfDelegateMethod
{
    NSLog(@"自己委托自己实现的方法");
}



//NextViewController是push进入的第二个页面
//NextViewController.h 文件
//定义一个协议，前一个页面ViewController要服从该协议，并且实现协议中的方法
@protocol NextViewControllerDelegate <NSObject>
- (void)passTextValue:(NSString *)tfText;
@end

@interface NextViewController : UIViewController
@property (nonatomic, assign) id<NextViewControllerDelegate> delegate;

@end

//NextViewController.m 文件
//点击Button返回前一个ViewController页面
- (IBAction)popBtnClicked:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(passTextValue:)]) {
        //self.inputTF是该页面中的TextField输入框
        [self.delegate passTextValue:self.inputTF.text];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

//ViewController.m 文件
@interface ViewController ()<NextViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *nextVCInfoLabel;

@end
//点击Button进入下一个NextViewController页面
- (IBAction)btnClicked:(id)sender
{
    NextViewController *nextVC = [[NextViewController alloc] initWithNibName:@"NextViewController" bundle:nil];
    nextVC.delegate = self;//设置代理
    [self.navigationController pushViewController:nextVC animated:YES];
}

//实现协议NextViewControllerDelegate中的方法
#pragma mark - NextViewControllerDelegate method
- (void)passTextValue:(NSString *)tfText
{
    //self.nextVCInfoLabel是显示NextViewController传递过来的字符串Label对象
    self.nextVCInfoLabel.text = tfText;
}


－－－－－
//NextViewController.h 文件
@interface NextViewController : UIViewController@property (nonatomic, copy) void (^NextViewControllerBlock)(NSString *tfText);

@end//NextViewContorller.m 文件- (IBAction)popBtnClicked:(id)sender {    if (self.NextViewControllerBlock) {        self.NextViewControllerBlock(self.inputTF.text);    }    [self.navigationController popViewControllerAnimated:YES];}

- (IBAction)btnClicked:(id)sender
{    NextViewController *nextVC = [[NextViewController alloc] initWithNibName:@"NextViewController" bundle:nil];    nextVC.NextViewControllerBlock = ^(NSString *tfText){        [self resetLabel:tfText];    };    [self.navigationController pushViewController:nextVC animated:YES];}#pragma mark - NextViewControllerBlock method- (void)resetLabel:(NSString *)textStr{    self.nextVCInfoLabel.text = textStr;}
