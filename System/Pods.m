//
//  Pods.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>
#pod 'RongCloudIMKit'
pod install --verbose --no-repo-update
pod update --verbose --no-repo-update

命令行更新（安装）步骤【更新】

$ sudo gem update --system // 先更新gem，国内需要切换源
$ gem sources --remove https://rubygems.org/
$ gem sources -a https://ruby.taobao.org/
$ gem sources -l
\*\*\* CURRENT SOURCES \*\*\*
https://ruby.taobao.org/
$ sudo gem install cocoapods // 安装cocoapods      sudo gem install -n /usr/local/bin cocoapods
$ pod setup
和安装过程是一样的，再次查看版本
sudo gem install cocoa pods -v
就会出现这样的提示：

1
ERROR:  While executing gem ... (Errno::EPERM) Operation not permitted - /usr/bin/pod。


为了解决上面提到的问题，以及Cocoapods在OS X 10.11系统上的正常使用，我们需要在命令行输入这样一句话，

1
sudo gem install -n /usr/local/bin cocoapods
$ pod --version
0.39.0

pod
http://search.twitter.com/search.json?q=skyfall
gem sources -a http://ruby.taobao.org
gem sources -d http://rubygems.org/
gem sources -m https://rubygems.org/
sudo gem install cocoapods
ORM :Object Relational Mapping
1. sudo ln -s /Library/Developer/CommandLineTools/Library/Perl/5.16/darwin-thread-multi-2level/auto/SVN /Applications/SourceTree.app/Contents/Resources/git_local/lib/perl5/site_perl/5.16.2/darwin-thread-multi-2level/auto/
2. sudo ln -s /Library/Developer/CommandLineTools/Library/Perl/5.16/darwin-thread-multi-2level/SVN /Applications/SourceTree.app/Contents/Resources/git_local/lib/perl5/site_perl/5.16.2/darwin-thread-multi-2level/

Mantle
JSONModel
YYModel
www.apix.cn
json accelerator


pod install --verbose --no-repo-update

pod 'ReactiveCocoa', '~> 4.0.2-alpha-1’