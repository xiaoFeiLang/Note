//
//  KVO.m
//  Note
//
//  Created by Loulou on 16/7/19.
//
//

#import <Foundation/Foundation.h>

1.
[stockForKVO addObserver:self forKeyPath:@"price" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];

2.
[testPerson setValue:[NSNumber numberWithInt:h+1] forKey:@"height"];

3.
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"price"])
    {
        myLabel.text = [NSString stringWithFormat:@"%@",[stockForKVO valueForKey:@"price"]];
    }
}