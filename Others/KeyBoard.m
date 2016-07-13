//
//  KeyBoard.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>

键盘
- (IBAction)endEdit:(id)sender {
    [self.nameText resignFirstResponder];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"sdfdsf");
    
    [self.nameText resignFirstResponder];
}
[self.postNumberText addTarget:self action:@selector(editingEvent:) forControlEvents:UIControlEventEditingDidBegin];
//通知
- (void)editingEvent:(UITextField *)sender {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWillShow:)
     
                                                 name:UIKeyboardWillShowNotification
     
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWillHide:)
     
                                                 name:UIKeyboardWillHideNotification
     
                                               object:nil];
    
}


- (void)keyboardWillShow:(NSNotification *)notif {
    
    CGRect keyboardRect = [notif.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    NSTimeInterval duration = [notif.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    CGFloat maxOffsetY = -self.view.bounds.size.height;
    
    for (UIView * subView in self.view.subviews) {
        
        if (!subView.hidden) {
            
            CGFloat endY = CGRectGetMaxY(subView.frame);
            
            CGFloat offsetY = endY + keyboardRect.size.height - CGRectGetHeight(self.view.bounds);
            
            if (maxOffsetY < offsetY) {
                
                maxOffsetY = offsetY;
                
            }
            
        }
        
    }
    
    if (maxOffsetY > 0) {
        
        [UIView animateWithDuration:duration animations:^{
            
            self.view.bounds = CGRectMake(0, maxOffsetY, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
            
            [self.view layoutIfNeeded];
            
        }];
        
    }
    
}


- (void)keyboardWillHide:(NSNotification *)notif {
    
    NSTimeInterval duration = [notif.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:duration animations:^{
        
        self.view.bounds = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
        
    }];
    
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    
    [self.view endEditing:YES];
    
}



