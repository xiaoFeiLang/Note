//
//  水平TableView.m
//  Note
//
//  Created by loulou on 16/6/28.
//
//

#import <Foundation/Foundation.h>

水平列表
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView *table  = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, 60, 480)];
    table.backgroundColor = [UIColor whiteColor];
    
    table.transform = CGAffineTransformMakeRotation(M_PI/-2);
    table.showsVerticalScrollIndicator = NO;
    table.frame = CGRectMake(0, 0, 320, 60);
    table.rowHeight = 60.0;
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 16;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier] ;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.transform = CGAffineTransformMakeRotation(M_PI/2);
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row+1];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str=[NSString stringWithFormat:@"你选择的是第%i行",indexPath.row +1];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:str message:nil delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
