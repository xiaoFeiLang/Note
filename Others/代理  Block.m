//
//  代理  Block.m
//  Note
//
//  Created by loulou on 16/7/1.
//
//

#import <Foundation/Foundation.h>

delegate尽量用weak
//定义一个协议
@protocol ViewControllerDelegate<NSObject>
- (void)selfDelegateMethod;
@end

//本类实现这个协议ViewControllerDelegate
@interface ViewController ()<ViewControllerDelegate>
@property (nonatomic, assign) id<ViewControllerDelegate> delegate;

@end

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


//***************************************************  start  ************************************************************

//NextViewController.h 文件
@interface NextViewController : UIViewController
@property (nonatomic, copy) void (^NextViewControllerBlock)(NSString *tfText);

@end
//NextViewContorller.m 文件
- (IBAction)popBtnClicked:(id)sender {
    if (self.NextViewControllerBlock) {
        self.NextViewControllerBlock(self.inputTF.text);
    }
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)btnClicked:(id)sender
{
    NextViewController *nextVC = [[NextViewController alloc] initWithNibName:@"NextViewController" bundle:nil];
    nextVC.NextViewControllerBlock = ^(NSString *tfText){
        [self resetLabel:tfText];
    };
    [self.navigationController pushViewController:nextVC animated:YES];
}
#pragma mark - NextViewControllerBlock method
- (void)resetLabel:(NSString *)textStr
{
    self.nextVCInfoLabel.text = textStr;
}
//***************************************************   end   ************************************************************
