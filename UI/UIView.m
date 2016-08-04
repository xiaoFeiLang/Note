//
//  UIView.m
//  Note
//
//  Created by Loulou on 16/7/18.
//
//

#import <Foundation/Foundation.h>
hitTest:withEvent:
返回接收者视图层次中最远的派生（包括它本身）的特定的点。
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
参数
point
接收者坐标系中的点
event
触发这个方法的事件或者是如果这个方法被预调用就返回nil
返回值
一个视图对象最远的派生点。如果这个点位于接收者之外就返回nil
讨论
这个方法贯穿视图的层次发送pointInside:withEvent: 消息到每一个子视图用来决定那个子视图需要接收触摸事件。如果pointInside:withEvent: 返回YES，那么视图的层次全部贯穿；否则视图层次的分支是被否定的。你不太需要调用这个方法，但是你需要重写它用来隐藏子视图的触摸事件。
如果视图是隐藏的，禁止用户交互的或者透明值小于01那么这个方法不可用

insertSubview:aboveSubview:
在视图层次顶层插入一个视图
- (void)insertSubview:(UIView *)view aboveSubview:(UIView *)siblingSubview
参数
view
一个插入被用来放在顶层的视图。它将会从父视图中移除如果它不是相邻视图
siblingSubview
一个相邻视图用来放在插入视图的後面

insertSubview:atIndex:
插入视图到指定的索引
- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index
参数
view
插入的视图，这个值不能是nil
index
子视图索引从0开始并且不能大于子视图的数量


sendSubviewToBack:
移动指定的子视图到它相邻视图的後面
- (void)sendSubviewToBack:(UIView *)view
参数
view
一个子视图用来移动到它後面去

/**
 *  计算一个view相对于屏幕(去除顶部statusbar的20像素)的坐标
 *  iOS7下UIViewController.view是默认全屏的，要把这20像素考虑进去
 */
+ (CGRect)relativeFrameForScreenWithView:(UIView *)v
{
    BOOL iOS7 = [[[UIDevice currentDevice] systemVersion] floatValue] >= 7;
    
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    if (!iOS7) {
        screenHeight -= 20;
    }
    UIView *view = v;
    CGFloat x = .0;
    CGFloat y = .0;
    while (view.frame.size.width != 320 || view.frame.size.height != screenHeight) {
        x += view.frame.origin.x;
        y += view.frame.origin.y;
        view = view.superview;
        if ([view isKindOfClass:[UIScrollView class]]) {
            x -= ((UIScrollView *) view).contentOffset.x;
            y -= ((UIScrollView *) view).contentOffset.y;
        }
    }
    return CGRectMake(x, y, v.frame.size.width, v.frame.size.height);
}

CGRect frame = [view convertRect:view.bounds toView:nil];  