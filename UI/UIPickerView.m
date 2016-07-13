//
//  UIPickerView.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>

UIPickView

//
//  ViewController.m
//  城市经纬查询
//
//  Created by mac on 13-11-29.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSString* path=[[NSBundle mainBundle]
                    pathForResource:@"数据" ofType:@"plist"];
    array=[[NSArray alloc]
           initWithContentsOfFile:path];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    if(0==component)
        return array.count;
    else
    {
        row0Component=[pickerView selectedRowInComponent:0];
        return [[[array objectAtIndex:row0Component] objectForKey:@"Cities"]count];
    }
}
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 150;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (0 == component) {
        return [[array objectAtIndex:row] objectForKey:@"State"];
    } else {
        
        row0Component = [pickerView selectedRowInComponent:0];
        return [[[[array objectAtIndex:row0Component] objectForKey:@"Cities"] objectAtIndex:row] objectForKey:@"city"];
    }
}
//-(UIView*)pickerView:(UIPickerView *)pickerView
//          viewForRow:(NSInteger)row forComponent:(NSInteger)component
//         reusingView:(UIView *)view
//{
//    CGFloat width=[self pickerView:pickerView widthForComponent:component];
//    CGFloat height=[self pickerView:pickerView rowHeightForComponent:component];
//    UILabel* la;
//    if(nil==view)
//    {
//        la=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
//    }
//    else
//         la=(UILabel*)view;
//    if(0==component)
//    {
//        la.text=[[array objectAtIndex:row]
//                    objectForKey:@"State"];
//        la.font=[UIFont fontWithName:@"Arial" size:20];
//        la.textAlignment=NSTextAlignmentCenter;
//
//    }
//    else
//    {
//
//        row0Component=[pickerView selectedRowInComponent:0];
//
//        la.text=[[[[array objectAtIndex:row0Component]
//                      objectForKey:@"Cities"]
//                     objectAtIndex:row]
//                    objectForKey:@"city"];
//        la.font=[UIFont fontWithName:@"Arial" size:20];
//        la.textAlignment=NSTextAlignmentCenter;
//        la.textColor=[UIColor blueColor];
//
//    }
//
//    return la;
//}
-(void)pickerView:(UIPickerView *)pickerView
     didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(0==component)
    {
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:NO];
    }
    row0Component=[pickerView selectedRowInComponent:0];
    row1Component=[pickerView selectedRowInComponent:1];
    NSNumber* numlon=[[[[array objectAtIndex:row0Component] objectForKey:@"Cities"]
                       objectAtIndex:row1Component] objectForKey:@"lon"];
    NSNumber* numlat=[[[[array objectAtIndex:row0Component] objectForKey:@"Cities"]
                       objectAtIndex:row1Component] objectForKey:@"lat"];
    label.text=[NSString stringWithFormat:@"%@N,%@E",numlat,numlon];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
