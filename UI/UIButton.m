//
//  UIButton.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>
Intrinsic Size  场景一，为UILabe，UIButton等设置额外的Padding
@implementation RoundButton


-(CGSize)intrinsicContentSize{
        CGSize size = [super intrinsicContentSize];
        size.width += size.height;
        return size;
}
-(void)layoutSubviews{
        [super layoutSubviews];
        self.layer.cornerRadius = ceil(self.bounds.size.height/2);
        self.layer.masksToBounds = YES;
}
@end
场景二，让父视图根据子视图来自适应自己的大小(为了方便，我在IB上拖拽了，代码实现类似)

