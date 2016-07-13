//
//  九宫格.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>

__block UIView *lastView = nil;
// 间距为10
int intes = 10;
// 每行3个
int num = 3;
NSInteger count = 7;
// 循环创建view
for (int i = 0; i < count; i++) {
    
    UIView *view = [UIView new];
    [self.pictureV addSubview:view];
    view.backgroundColor = [UIColor colorWithHue:(arc4random() % 256 / 256.0 ) saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                      brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:0.2];
    
    // 添加约束
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        // 给个高度约束
        make.height.mas_equalTo(80);
        
        // 1. 判断是否存在上一个view
        if (lastView) {
            // 存在的话宽度与上一个宽度相同
            make.width.equalTo(lastView);
        } else {
            // 否则计算宽度  ！！！此处的判断条件是为了避免 最后一列约束冲突
            /**
             *  这里可能大家会问 为什么上面我说最后一列会有冲突？
             *  如果不添加判断的话会造成：
             *  1添加了宽度约束 2所有列加了左侧约束 第3步给 最后一列添加了右侧约束
             *  这里最后一列既有左侧约束又有右侧约束还有宽度约束 会造成约束冲突
             *  所以这里添加宽度时将最后一列剔除
             */
            if (i % num != 0) {
                make.width.mas_equalTo((view.superview.frame.size.width - (num + 1)* intes)/4);
            }
        }
        // 2. 判断是否是第一列
        if (i % num == 0) {
            // 一：是第一列时 添加左侧与父视图左侧约束
            make.left.mas_equalTo(view.superview).offset(intes);
        } else {
            // 二： 不是第一列时 添加左侧与上个view左侧约束
            make.left.mas_equalTo(lastView.mas_right).offset(intes);
        }
        // 3. 判断是否是最后一列 给最后一列添加与父视图右边约束
        if (i % num == (num - 1)) {
            make.right.mas_equalTo(view.superview).offset(-intes);
        }
        // 4. 判断是否为第一列
        if (i / num == 0) {
            // 第一列添加顶部约束
            make.top.mas_equalTo(view.superview).offset(intes*10);
        } else {
            // 其余添加顶部约束 intes*10 是我留出的距顶部高度
            make.top.mas_equalTo(intes * 10 + ( i / num )* (80 + intes));
            
        }
        if (i / num == count/3-1) {
            make.bottom.equalTo(self.contentView);
        }
        
        //                if (lastView) {
        //                make.bottom.equalTo(self.contentView);
        //            }
        
    }];
    // 每次循环结束 此次的View为下次约束的基准
    lastView = view;
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.pictureV = [[UIView alloc] init];
    self.pictureV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.pictureV];
    for (UIView *view in self.pictureV.subviews) {
        [view removeFromSuperview];
    }
    NSInteger pictureList = 15;
    CGFloat contentW = screen_width - 20;
    
    
    CGFloat picBorder = screenW * 25.0/1080.0;
    CGFloat picW = (contentW-2*picBorder)/3.0;
    
    
    
    //行数
    NSInteger picRow;
    if (pictureList%3 == 0) {
        picRow = pictureList/3;
    }else{
        picRow = pictureList/3+1;
    }
    
    CGRect pictureVFrame = CGRectMake(10, 100, contentW, picRow*(picW+picBorder)+picBorder);
    self.pictureV.frame = pictureVFrame;
    
    for (int i = 0; i < pictureList; i++){
        
        UIImageView *picImageView = [[UIImageView alloc] initWithFrame:CGRectMake((i%3)*(picW+picBorder), picBorder+(picW+picBorder)*(i/3), 100, 100)];
        picImageView.backgroundColor = [UIColor grayColor];
        [self.pictureV addSubview:picImageView];
    }
    
}