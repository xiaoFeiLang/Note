//
//  bk_blocks.m
//  Note
//
//  Created by Loulou on 16/8/8.
//
//

#import <Foundation/Foundation.h>
//UIAlertView
UIAlertView *alertView = [[UIAlertView alloc] bk_initWithTitle:@"提示" message:@"提示信息"];
[alertView bk_setCancelButtonWithTitle:@"取消" handler:nil];
[alertView bk_addButtonWithTitle:@"确定" handler:nil];
[alertView bk_setDidDismissBlock:^(UIAlertView *alert, NSInteger index) {
    if (index == 1) {
        NSLog(@"%ld clicked",index);
    }
}];
[alertView show];

//UIActionSheet
[[UIActionSheet bk_actionSheetCustomWithTitle:nil buttonTitles:@[@"查看", @"退出"] destructiveTitle:nil cancelTitle:@"取消" andDidDismissBlock:^(UIActionSheet *sheet, NSInteger index) {
    
}] showInView:self.view];

//UIButton
UIButton *button = [[UIButton alloc] init];
[button bk_addEventHandler:^(id sender) {
    
} forControlEvents:UIControlEventTouchUpInside];

//UITapGestureRecognizer
UITapGestureRecognizer *tapGestureRecognizer = [UITapGestureRecognizer bk_recognizerWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
    if (state == UIGestureRecognizerStateRecognized) {
        ...
    }
}];