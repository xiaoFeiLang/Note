//
//  undoManager.m
//  Note
//
//  Created by Loulou on 16/7/20.
//
//

#import <Foundation/Foundation.h>

在UIViewController中使用undoManager，要切忌在viewDidAppear之后，才会被初始化。viewdidLoad中使用undoManager是nil的。

注册撤销（压栈）：
[self.undoManager registerUndoWithTarget:self selector:@selector(undoAction:) object:@1];

执行撤销：
[self.undoManager undo];
则invoke方法undoAction
- (void)undoAction:(NSNumber *)num
{
    NSLog(@"%@",num);
    [self.undoManager registerUndoWithTarget:self selector:@selector(undoAction:) object:num];
    
}

这里为什么要再register呢？这是为了还原。撤销之后要及时register刚撤销的状态。
执行还原（出栈）：
[self.undoManager redo];
亦会invoke方法undoAction。