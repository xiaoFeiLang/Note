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

,UIView的setNeedsDisplay和setNeedsLayout方法
首先两个方法都是异步执行的。而setNeedsDisplay会调用自动调用drawRect方法，这样可以拿到  UIGraphicsGetCurrentContext，就可以画画了。而setNeedsLayout会默认调用layoutSubViews，
就可以  处理子视图中的一些数据。
综上所诉，setNeedsDisplay方便绘图，而layoutSubViews方便出来数据。
layoutSubviews在以下情况下会被调用：
1、init初始化不会触发layoutSubviews。
2、addSubview会触发layoutSubviews。
3、设置view的Frame会触发layoutSubviews，当然前提是frame的值设置前后发生了变化。
4、滚动一个UIScrollView会触发layoutSubviews。
5、旋转Screen会触发父UIView上的layoutSubviews事件。
6、改变一个UIView大小的时候也会触发父UIView上的layoutSubviews事件。
7、直接调用setLayoutSubviews。

drawRect在以下情况下会被调用：
1、如果在UIView初始化时没有设置rect大小，将直接导致drawRect不被自动调用。drawRect调用是在Controller->loadView, Controller->viewDidLoad 两方法之后掉用的.所以不用担心在控制器中,这些View的drawRect就开始画了.这样可以在控制器中设置一些值给View(如果这些View draw的时候需要用到某些变量值).
2、该方法在调用sizeToFit后被调用，所以可以先调用sizeToFit计算出size。然后系统自动调用drawRect:方法。
3、通过设置contentMode属性值为UIViewContentModeRedraw。那么将在每次设置或更改frame的时候自动调用drawRect:。
4、直接调用setNeedsDisplay，或者setNeedsDisplayInRect:触发drawRect:，但是有个前提条件是rect不能为0。
以上1,2推荐；而3,4不提倡

drawRect方法使用注意点：
1、若使用UIView绘图，只能在drawRect：方法中获取相应的contextRef并绘图。如果在其他方法中获取将获取到一个invalidate的ref并且不能用于画图。drawRect：方法不能手动显示调用，必须通过调用setNeedsDisplay 或者 setNeedsDisplayInRect，让系统自动调该方法。
2、若使用calayer绘图，只能在drawInContext: 中（类似于drawRect）绘制，或者在delegate中的相应方法绘制。同样也是调用setNeedDisplay等间接调用以上方法
3、若要实时画图，不能使用gestureRecognizer，只能使用touchbegan等方法来掉用setNeedsDisplay实时刷新屏幕