//
//  判断为空.m
//  Note
//
//  Created by loulou on 16/7/3.
//
//

#import <Foundation/Foundation.h>

NSArray
- (id)safeObjectAtIndex:(NSUInteger)index {
    if (index < self.count) {
        return self[index];
    }
    return nil;
}

- (void)safeAddObject:(id)object{
    if (object) {
        [self addObject:object];
    }
}
NSDictionary
- (id)safeObjectForKey:(id)aKey
{
    id obj = [self objectForKey:aKey];
    if ([obj isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return obj;
}

- (void)safeSetObject:(id)anObject forKey:(id)aKey{
    if(!aKey || aKey == [NSNull null]) {
        return;
    }
    if(anObject && anObject != [NSNull null]) {
        [self setObject:anObject forKey:aKey];
    }
}
NSString
- (NSString *)safeCharacterAtIndex:(NSUInteger)index {
    if (index < self.length) {
        return [NSString stringWithFormat:@"%C",[self characterAtIndex:index]];
    }else {
        return nil;
    }
}

- (NSString *)safeSubstringFromIndex:(NSUInteger)from {
    if (from < self.length) {
        return [self substringFromIndex:from];
    }else {
        return nil;
    }
}

- (NSString *)safeSubstringToIndex:(NSUInteger)to {
    if (to < self.length) {
        return [self substringToIndex:to];
    }else {
        return nil;
    }
}

- (NSString *)safeSubstringWithRange:(NSRange)range {
    if (range.location < self.length && range.location + range.length < self.length) {
        return [self substringWithRange:range];
    }else {
        return nil;
    }
}

文／CodeGeass（简书作者）
原文链接：http://www.jianshu.com/p/971a3838a1d1
著作权归作者所有，转载请联系作者获得授权，并标注“简书作者”。