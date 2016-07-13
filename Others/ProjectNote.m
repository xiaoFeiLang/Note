//
//  ProjectNote.m
//  Note
//
//  Created by loulou on 16/6/29.
//
//

#import <Foundation/Foundation.h>
判断返回数据为空

isEqual:[NSNull null]

//29，iOS和iPad各app图标和启动页尺寸。
iphone APP图标尺寸：57X57    高清：114X114  单位：pixel   命名：无特殊要求，最好是，app_icon  高清的要加@2x
iphone 启动页尺寸：大小最好是320X460或320X480（相当于整个屏幕尺寸） 单位：pixel 命名：Default.png
iPad APP图标尺寸：72X72 高清：144X144  单位：pixel 命名：
ipad 启动页尺寸：大小最好是768X1004或768X1024  单位：pixel 命名：Default-Portrait~ipad.png   高清：Default-Portrait@2x~ipad.png

//在plist文件中新增一个配置：
Information Property List
    Status bar is initially hidden YES
[UIApplication sharedApplication].statusBarHidden = NO;

//1、获取全局的Delegate对象，这样我们可以调用这个对象里的方法和变量：

[(MyAppDelegate*)[[UIApplication sharedApplication] delegate] MyMethodOrMyVariable];

//2、获得程序的主Bundle：

NSBundle *bundle = [NSBundle mainBundle];
Bundle可以理解成一种文件夹，其内容遵循特定的框架。

Main Bundle一种主要用途是使用程序中的资源文件，如图片、声音、plst文件等。

NSURL *plistURL = [bundle URLForResource:@"plistFile" withExtension:@"plist"];
上面的代码获得plistFile.plist文件的路径

//6、获得设备版本号：

float version = [[[UIDevice currentDevice] systemVersion] floatValue];

//捕捉程序关闭或者进入后台事件：

UIApplication *app = [UIApplication sharedApplication];
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
applicationWillResignActive:这个方法中添加想要的操作

//3、获取截屏

- (UIImage *)getScreenShot {
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

ScrollView莫名其妙不能在viewController划到顶怎么办？  self.automaticallyAdjustsScrollViewInsets = NO;