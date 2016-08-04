//
//  xib.m
//  Note
//
//  Created by Loulou on 16/8/2.
//
//

#import <Foundation/Foundation.h>
/*
 //- (QXN_UsedBottomView *)bottomView{
 //
 //    if (!_bottomView) {
 //
 //        NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"QXN_UsedBottomView" owner:nil options:nil];
 //        _bottomView = [nibContents lastObject];
 //        [self.view addSubview:_bottomView];
 //        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
 //            make.left.right.equalTo(self.view);
 //            make.bottom.equalTo(self.view);
 //            make.height.mas_equalTo(@50);
 //        }];
 //    }
 //    return _bottomView;
 //}
 */

// 第一种方法（较为常用）
CYLView *view = [[[NSBundle mainBundle] loadNibNamed:@"CYLView" owner:nil options:nil] firstObject]; // CYLView代表CYLView.xib，代表CYLView这个类对应的xib文件。这个方法返回的是一个NSArray，我们取第一个Object或最后一个（因为这个数组只有一个CYLView没有其他对象）就是需要加载的CYLView。

// 第二种方法
UINib *nib = [UINib nibWithNibName:@"CYLView" bundle:nil];
NSArray *objectArray = [nib instantiateWithOwner:nil options:nil];
CYLView *view = [objectArray firstObject];