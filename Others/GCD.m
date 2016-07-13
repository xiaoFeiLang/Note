//
//  GCD.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>
串行：同一时间内有且只有一个任务被执行
并发：同一时间内有多个任务被执行

同步：在当前线程中执行任务，不具备开启新线程的能力
异步：在新的线程中执行任务，具备开启新线程的能力

- (IBAction)downloadAction:(UIButton *)sender
{
    [self resetImage];
    self.status.text = @"正在下载";
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t downloadImage = dispatch_group_create();
    
    for (ImageInfo *info in self.imageList) {
        NSString* imagePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:info.imageName];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        // 如果本地不存在图片，则从网络中下载
        if (![fileManager fileExistsAtPath:imagePath]) {
            dispatch_group_async(downloadImage, queue, ^{
                NSLog(@"Starting image download:%@", imagePath);
                // URL组装和编码
                NSString *urlString = [NSString stringWithFormat:@"%@/%@", self.baseUrl, info.imageName];
                NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
                NSLog(@"image download from url:%@", urlString);
                
                // 开始下载图片
                NSData *responseData = [NSData dataWithContentsOfURL:url];
                // 将图片保存到指定路径中
                [responseData writeToFile:imagePath atomically:YES];
                // 将下载的图片赋值给info
                info.image = [UIImage imageWithData:responseData];
                NSLog(@"image download finish:%@", imagePath);
            });
        } else { // 将本地图片加载到systemInfo.MyImage
            info.image = [UIImage imageWithData:[NSData dataWithContentsOfFile:imagePath]];
        }
    }
    dispatch_group_notify(downloadImage, dispatch_get_main_queue(), ^{
        // 图片加载完毕之后，显示出来
        self.status.text = @"图片文件下载并缓存完毕";
        [self showImage];
    });
}

//***************************************************  start  ************************************************************

dispatch_group_t group = dispatch_group_create();
dispatch_group_enter(group);
[RecipeInfo fetchRecipeWithCompletionBlock:^(id returnValue) {
    info = [RecipeInfo yy_modelWithDictionary:returnValue];
    dispatch_group_leave(group);
} WithFailureBlock:^(NSError *error) {
    dispatch_group_leave(group);
}];

dispatch_group_enter(group);
[HomePageNavContent fetchNavContentWithCompletionBlock:^(id returnValue) {
    navContent = [HomePageNavContent yy_modelWithDictionary:returnValue];
    dispatch_group_leave(group);
} WithFailureBlock:^(NSError *error) {
    dispatch_group_leave(group);
}];

dispatch_group_notify(group, dispatch_get_main_queue(), ^{
    [self.tableView reloadData];
});


//***************************************************   end   ************************************************************
