//
//  UITextField.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>

/**
 *  判断输入为空格
 */
- (BOOL)isBlankString:(NSString *)string{
    
    if (string == nil) {
        return YES;
    }
    
    if (string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

//限制输入的字数

实现textField:shouldChangeCharactersInRange:replacementString:方法；
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    int kMaxLength = 11;
    
    
    NSInteger strLength = textField.text.length - range.length + string.length;
    //输入内容的长度 - textfield区域字符长度（一般=输入字符长度）+替换的字符长度（一般为0）
    return (strLength <= kMaxLength);}


//***************************************************  start  ************************************************************

TextInputLimit
http://www.jianshu.com/p/c6f1ff508f01
https://github.com/xuwening/textInputLimit
TextInputLimit是ios下的一个文本框输入文字长度限制的库，使用起来十分简单方便。

使用方式：

将textInputLimit的.h和.m直接拷贝到工程中，然后调用需要做输入长度限制的textField或textView对象方法：

[textObj setValue:@4 forKey:@"limit"];

使用过程中不需要对UITextField和UITextView或Xib文件做任何修改，也不需要引用头文件。

扩展（可选项）

如果需要在输入限制的同时，做些额外处理，如：提示用户输入文字过多，或做些动画特效等，可以注册acceptLimitLength通知。

[[NSNotificationCenter defaultCenter] addObserver:self
                                         selector:@selector(textLimitLenght:)
                                             name:@"acceptLimitLength"
                                           object:nil];


-(void) textLimitLenght: (NSNotification *) notification {
    
    NSObject *object = notification.object;
    
    if ([object isEqual: self.textview]) {
        //收到来自textview的输入限制
    }
    
    if ([object isEqual: self.textfield]) {
        //收到来自textfield的输入限制
    }
    //提示
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:@"您输入的长度过长，自动被截断。"
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil, nil];
    [alert show];
}

//***************************************************   end   ************************************************************


- (UILabel *)placeholder{
    
    if (!_placeholder) {
        _placeholder = [UILabel new];
        _placeholder.text = @"请输入举报内容";
        _placeholder.font = FONT(11);
        _placeholder.textColor = UIColorFromRGB(0x666666);
        [self.content addSubview:_placeholder];
    }
    return _placeholder;
}

#pragma mark - UITextView Delegate
- (void)textViewDidEndEditing:(UITextView *)textView{
    
    if (self.didInputText) {
        self.didInputText(self.content.text);
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if (self.content.text.length == 0){
        
        if ([text isEqualToString:@""]) {
            
            self.placeholder.hidden = NO;
            
        } else {
            
            self.placeholder.hidden = YES;
            
        }
        
    } else {
        
        if (self.content.text.length == 1) {
            
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
}