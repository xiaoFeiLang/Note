//
//  UICollectionView.m
//  Note
//
//  Created by Loulou on 16/7/27.
//
//

#import <Foundation/Foundation.h>

//找到每一个按钮；
UIButton *deviceImageButton = cell.imageButton;
[deviceImageButton addTarget:self action:@selector(deviceButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

//实现点击事件
- (void)deviceButtonPressed:(id)sender{
    
    UIView *v = [sender superview];//获取父类view
    CollectionViewCell *cell = (CollectionViewCell *)[v superview];//获取cell
    NSIndexPath *indexpath = [self.collectionView indexPathForCell:cell];//获取cell对应的indexpath;
    NSLog(@"设备图片按钮被点击:%ld        %ld",(long)indexpath.section,(long)indexpath.row);
    
}