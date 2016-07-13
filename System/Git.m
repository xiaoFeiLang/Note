//
//  Git.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>
git add .
git commit -m “.”
git pull
git push
git clean -d -fx


…or create a new repository on the command line

echo "# dsdsdsdsds" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/xiaoFeiLang/dsdsdsdsds.git
git push -u origin master

…or push an existing repository from the command line

git remote add origin https://github.com/xiaoFeiLang/dsdsdsdsds.git
git push -u origin master