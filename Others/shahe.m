//
//  shahe.m
//  Note
//
//  Created by Loulou on 16/8/11.
//
//

#import <Foundation/Foundation.h>
NSString *home = NSHomeDirectory();
NSString *documents = [home stringByAppendingPathComponent:@"Documents"];
// 不建议采用，因为新版本的操作系统可能会修改目录名


// NSUserDomainMask 代表从用户文件夹下找
// YES 代表展开路径中的波浪字符“~”
NSArray *array =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
// 在iOS中，只有一个目录跟传入的参数匹配，所以这个集合里面只有一个元素
NSString *documents = [array objectAtIndex:0];

tmp：NSString *tmp = NSTemporaryDirectory();

将一个NSDictionary对象归档到一个plist属性列表中

// 将数据封装成字典
NSMutableDictionary *dict = [NSMutableDictionary dictionary];
[dict setObject:@"母鸡" forKey:@"name"];
[dict setObject:@"15013141314" forKey:@"phone"];
[dict setObject:@"27" forKey:@"age"];
// 将字典持久化到Documents/stu.plist文件中
[dict writeToFile:path atomically:YES];

归档
NSArray *array = [NSArray arrayWithObjects:@”a”,@”b”,nil];
[NSKeyedArchiver archiveRootObject:array toFile:path];
恢复(解码)NSArray对象
NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:path];

归档（编码）

// 新建一块可变数据区
NSMutableData *data = [NSMutableData data];
// 将数据区连接到一个NSKeyedArchiver对象
NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
// 开始存档对象，存档的数据都会存储到NSMutableData中
[archiver encodeObject:person1 forKey:@"person1"];
[archiver encodeObject:person2 forKey:@"person2"];
// 存档完毕(一定要调用这个方法，调用了这个方法，archiver才会将encode的数据存储到NSMutableData中)
[archiver finishEncoding];
// 将存档的数据写入文件
[data writeToFile:path atomically:YES];
恢复（解码）

// 从文件中读取数据
NSData *data = [NSData dataWithContentsOfFile:path];
// 根据数据，解析成一个NSKeyedUnarchiver对象
NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
Person *person1 = [unarchiver decodeObjectForKey:@"person1"];
Person *person2 = [unarchiver decodeObjectForKey:@"person2"];
// 恢复完毕(这个方法调用之后，unarchiver不能再decode对象，而且会通知unarchiver的代理调用unarchiverWillFinish:和unarchiverDidFinish:方法)
[unarchiver finishDecoding];

文／hosea_zhou（简书作者）
原文链接：http://www.jianshu.com/p/a3eeae99e902
著作权归作者所有，转载请联系作者获得授权，并标注“简书作者”。