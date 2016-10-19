//
//  插件管理.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>
~/Library/Application Support/Developer/Shared/Xcode/Plug-ins/
使用如下的命令行来安装 Alcatraz：
mkdir -p ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins;
curl -L http://git.io/lOQWeA | tar xvz -C ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins
curl -fsSL https://raw.githubusercontent.com/supermarin/Alcatraz/deploy/Scripts/install.sh | sh


curl -fsSL https://raw.github.com/supermarin/Alcatraz/master/Scripts/install.sh | sh

如果你不想使用 Alcatraz 了，可以使用如下命令来删除：
rm -rf ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/Alcatraz.xcplugin
rm -rf ~/Library/Application\ Support/Alcatraz

defaults delete com.apple.dt.Xcode DVTPlugInManagerNonApplePlugIns-Xcode-7.3
//Xcode-写你自己的版本
