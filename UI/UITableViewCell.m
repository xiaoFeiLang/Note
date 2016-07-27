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


//*************************************************** 单选 start  ************************************************************

- (UITableViewCell *)tableView:(UITableView *)tableView
cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CheckMarkCellIdentifier = @"CheckMarkCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             CheckMarkCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CheckMarkCellIdentifier];
    }
    NSUInteger row = [indexPath row];
    NSUInteger oldRow = [lastIndexPath row];
    cell.textLabel.text = [list objectAtIndex:row];
    cell.accessoryType = (row == oldRow && lastIndexPath != nil) ?
    UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    return cell;
}

#pragma mark -
#pragma mark Table Delegate Methods
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int newRow = [indexPath row];
    int oldRow = (lastIndexPath != nil) ? [lastIndexPath row] : -1;
    
    if (newRow != oldRow) {
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:
                                    indexPath];
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:
                                    lastIndexPath];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        lastIndexPath = indexPath;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//***************************************************   end   ************************************************************


//***************************************************  start  ************************************************************
//iOS-7-Cookbook-master/C09 Tables/02 - Checks
// Return a cell for the index path
- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    // Cell label
    cell.textLabel.text = [items objectAtIndex:indexPath.row];
    BOOL isChecked = ((NSNumber *)stateDictionary[indexPath]).boolValue;
    cell.accessoryType =  isChecked ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    return cell;
}

// On selection, update the title and enable find/deselect
- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    BOOL isChecked = !((NSNumber *)stateDictionary[indexPath]).boolValue;
    stateDictionary[indexPath] = @(isChecked);
    
    cell.accessoryType = isChecked ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    NSInteger numChecked = 0;
    for (NSUInteger row = 0; row < items.count; row++)
    {
        NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
        isChecked = ((NSNumber *)stateDictionary[path]).boolValue;
        if (isChecked) numChecked++;
    }
    
    self.title = [@[@(numChecked).stringValue, @" Checked"] componentsJoinedByString:@" "];
}
//***************************************************   end   ************************************************************

对cell进行配置
在获取cell后，一般需要对cell的content进行配置，然后将配置后的cell展示出来。有以下3种方法能够对cell进行content配置，在这里大概提下，具体可以查看官网文档。

cellForRowAtIndexPath。这是最常用的一种方法，也是遵循UITableViewDataSource协议时必须实现的方法。一般在这里对cell内部的各个组件进行数据配置。
prepareForReuse。这个方法在dequeueReusableCellWithIdentifier返回cell前调用。一般在这里对cell的非content属性进行配置（如：editing、selection属性等）。
willDisplayCell:forRowAtIndexPath。这个方法在cellForRowAtIndexPath之后调用，也是cell在显示在屏幕前的最后一步能够进行修改的地方。一般在这里对cell进行状态改变信息的配置（如：selection属性、背景颜色等）。

文／MapleMeowMeow（简书作者）
原文链接：http://www.jianshu.com/p/5c6b3a6b97cc
著作权归作者所有，转载请联系作者获得授权，并标注“简书作者”。


