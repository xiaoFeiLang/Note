//
//  Masonry.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>

布局
* 1、在界面中拖入三个按钮,让三个按钮等宽

* 2、设置左边第一个按钮的左边上下左右的约束全部为0

* 3、设置中间的按钮上右下的约束为0,左边的约束已经设置不必再重复设置

* 4、设置右边的按钮上右下的约束为0,最后更新约束



UIEdgeInsets padding = UIEdgeInsetsMake();
make.edges.equalTo().insets();

给视图一个最小或最大值
//width >= 200 && width <= 400
make.width.greaterThanOrEqualTo(@200);
make.width.lessThanOrEqualTo(@400)

make.top.mas_equalTo(42);
make.height.mas_equalTo(20);
make.size.mas_equalTo(CGSizeMake(50, 100));
make.edges.mas_equalTo(UIEdgeInsetsMake(10, 0, 10, 0));
make.left.mas_equalTo(view).mas_offset(UIEdgeInsetsMake(10, 0, 10, 0));

约束的优先级
.priority 允许你指定一个精确的优先级,数值越大优先级越高.最高1000.
.priorityHigh 等价于 UILayoutPriorityDefaultHigh.优先级值为 750.
.priorityMedium 介于高优先级和低优先级之间,优先级值在 250~750之间.
.priorityLow 等价于 UILayoutPriorityDefaultLow, 优先级值为 250.
优先级可以在约束的尾部添加:
make.left.greaterThanOrEqualTo(label.mas_left).with.priorityLow();

make.top.equalTo(label.mas_top).with.priority(600);

edges 边界
//使 top, left, bottom, right等于 view2
make.edges.equalTo(view2);

//使 top = superview.top + 5, left = superview.left + 10,
//      bottom = superview.bottom - 15, right = superview.right - 20
make.edges.equalTo(superview).insets(UIEdgeInsetsMake(5, 10, 15, 20))

size 尺寸
// 使宽度和高度大于或等于 titleLabel
make.size.greaterThanOrEqualTo(titleLabel)

//使 width = superview.width + 100, height = superview.height - 50
make.size.equalTo(superview).sizeOffset(CGSizeMake(100, -50))

center 中心
全选复制放进笔记
//使 centerX和 centerY = button1
make.center.equalTo(button1)

//使 centerX = superview.centerX - 5, centerY = superview.centerY + 10
make.center.equalTo(superview).centerOffset(CGPointMake(-5, 10))

你可以使用链式语法来增强代码可读性:
// 除top外,其他约束都与父视图相等.
make.left.right.bottom.equalTo(superview);
make.top.equalTo(otherView);

更新约束
有时,你需要修改已经存在的约束来实现动画效果或者移除/替换已有约束.
在 Masonry 中,有几种不同的更新视图约束的途径:
1. References 引用
你可以把 Masonry 语法返回的约束或约束数组,存储到一个局部变量或者类的属性中,以供后续操作某个约束.
// 声明属性
@property (nonatomic, strong) MASConstraint *topConstraint;

...

// when making constraints
[view1 mas_makeConstraints:^(MASConstraintMaker *make) {
    self.topConstraint = make.top.equalTo(superview.mas_top).with.offset(padding.top);
    make.left.equalTo(superview.mas_left).with.offset(padding.left);
}];

...
// 然后你就可以操作这个属性.
[self.topConstraint uninstall];
2. mas_updateConstraints
如果你只是想添加新的约束,你可以使用便利方法mas_updateConstraints,不需要使用 mas_makeConstraints.mas_updateConstraints,不会移除已经存在的约束(即使新旧约束间相互冲突).
// 重写视图的updateConstraints方法: 这是Apple推荐的添加/更新约束的位置.
// 这个方法可以被多次调用以响应setNeedsUpdateConstraints方法.
// setNeedsUpdateConstraints 可以被UIKit内部调用或者由开发者在自己的代码中调用以更新视图约束.
- (void)updateConstraints {
    [self.growingButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@(self.buttonSize.width)).priorityLow();
        make.height.equalTo(@(self.buttonSize.height)).priorityLow();
        make.width.lessThanOrEqualTo(self);
        make.height.lessThanOrEqualTo(self);
    }];
    
    //根据apple机制,最后应调用父类的updateConstraints方法.
    [super updateConstraints];
}

3. mas_remakeConstraints
mas_remakeConstraints与mas_updateConstraints相似,不同之处在于: mas_remakeConstraints 会先移除视图上已有的约束,再去创建新的约束.
- (void)changeButtonPosition {
    [self.button mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.buttonSize);
        
        if (topLeft) {
            make.top.and.left.offset(10);
        } else {
            make.bottom.and.right.offset(-10);
        }
    }];
}

