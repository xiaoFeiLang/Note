//
//  UITableViewCell_register.m
//  Note
//
//  Created by Loulou on 16/7/21.
//
//

#import <Foundation/Foundation.h>

//***************************************************  start  ************************************************************
static NSString *CellTableIdentifier = @"CellTableIdentifier";
static BOOL nibsRegistered = NO;
if (!nibsRegistered) {
    UINib *nib = [UINib nibWithNibName:@"BIDNameAndColorCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:CellTableIdentifier];
    nibsRegistered = YES;
}

BIDNameAndColorCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             CellTableIdentifier];
//***************************************************   end   ************************************************************

//***************************************************  start  ************************************************************

//***************************************************   end   ************************************************************

