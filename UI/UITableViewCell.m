//
//  UITableViewCell.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>
func scrollToBottom() {
    let index = messageList.endIndex - 1
    let indexPath = NSIndexPath(forRow: index, inSection: 0)
    tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: false)
}

I’m not allowed to build a test project after adding the XXXX showing the following two errors:
Thanks for you guys too for guys for this much useful implementation

pdfds