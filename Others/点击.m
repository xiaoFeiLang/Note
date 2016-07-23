//
//  点击.m
//  Note
//
//  Created by Loulou on 16/7/21.
//
//

#import <Foundation/Foundation.h>
//***************************************************  start  ************************************************************
CGPoint point = [[touches anyObject] locationInView:self];
if (CGRectContainsPoint(self.h_selectRelations.frame , point) && self.clickSelectRelationsTextField) {
    
    self.clickSelectRelationsTextField(self.h_selectRelations);
}
//***************************************************   end   ************************************************************

