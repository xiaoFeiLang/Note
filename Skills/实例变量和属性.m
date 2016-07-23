//
//  实例变量和属性.m
//  Note
//
//  Created by Loulou on 16/7/19.
//
//

#import <Foundation/Foundation.h>

@property NSString* name;

生成的实例变量名将是_name
有2种方法访问这个实例变量，或者使用.操作符
NSString *n = self.name; 这等价于： NSString *n = [self name]
或者，直接使用实例变量名：
NSString *n = _name;
另外，不能采用_name=xxx的写法，原因在于，_name是实例变量，并不提供setter和getter方法，如需使用，需要重新getter和setter方法

访问的时候会调用getter方法来获取真正的实例变量，修改的时候会调用setter方法

成员变量 = 实例变量 + 基本数据类型变量