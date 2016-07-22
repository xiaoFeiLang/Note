//
//  UITableViewCell_Nib.m
//  Note
//
//  Created by Loulou on 16/7/18.
//
//

#import <Foundation/Foundation.h>
- (void)viewDidLoad {
    [super viewDidLoad];
    self.cellNib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.cellNib = nil;
    self.myNib = nil;
    self.customCell = nil;
}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        static NSString *CellIdentifier = @"Cell";
    
        CustomTableCell *cell = (CustomTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            [self.cellNib instantiateWithOwner:self options:nil];
            cell = self.customCell;
            self.customCell = nil;
        }
    
    	// Configure the cell.
        cell.titleLabel.text = [NSString stringWithFormat:@"Row %d", indexPath.row];
        return cell;
}

- (IBAction)cellButtonTapped:(id)sender {
    UIButton *button = sender;
    CGPoint correctedPoint =
    [button convertPoint:button.bounds.origin toView:self.tableView];
    NSIndexPath *indexPath =
    [self.tableView indexPathForRowAtPoint:correctedPoint];
    NSLog(@"Button tapped in row %d", indexPath.row);
}

#import "UITableView+PRPSubviewAdditions.h"

//@implementation UITableView (PRPSubviewAdditions)
//
//- (NSIndexPath *)prp_indexPathForRowContainingView:(UIView *)view {
//    CGPoint correctedPoint = [view convertPoint:view.bounds.origin
//                                         toView:self];
//    return [self indexPathForRowAtPoint:correctedPoint];
//}
//
//@end

- (void)dealloc {
    [cellNib release], cellNib = nil;
    [_myCell release];
    [_clickMyCell release];
    [super dealloc];
}