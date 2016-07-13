//
//  网络加载.m
//  Note
//
//  Created by loulou on 16/7/3.
//
//

#import <Foundation/Foundation.h>

//四种开启新线程方式
Pthreads
NSThread
GCD
NSOperation

//网络交互
iOS
    NSURLconnection
    NSURLSession
    CFNetwork
第三方
    ASIHttpRequest
    AFNetworking

NSURL *url = [NSURL URLWithString:@"https://gowalla.com/users/mattt.json"];
NSURLRequest *request = [NSURLRequest requestWithURL:url];
AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
    NSLog(@"Name: %@ %@", [JSON valueForKeyPath:@"first_name"], [JSON valueForKeyPath:@"last_name"]);
} failure:nil];
[operation start];

//JSON 解析(JavaScript Object Notation)
iOS
    NSJSONSerialization
第三方
    JSONKit
    YYModel

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.infoLabel = [[UILabel alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.infoLabel.text = @"网络加载中...";
    //    self.infoLabel.backgroundColor = [UIColor greenColor];
    
    
    /**
     *  创建异步任务
     */
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        //code here
        NSLog(@"这是异步任务", [NSThread currentThread]);
        
        /**
         *  访问网络，输出错误日志
         */
        {
            NSURL *url = [[NSURL alloc] initWithString:@"http://www.xxx.xxx"];
            NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
            
            NSError *error = nil;
            NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
            if (data == nil) {
                NSLog(@"send request failed: %@", error);
            }
        }
        
        
        /**
         *  此处模拟json串，进行解析
         */
        NSString *jsonString = @"{\"jsonKey\": \"这是网络数据中，jsonKey对应的数据\"}";
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSString *result;
        {
            NSError *error;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
            if (json == nil) {
                NSLog(@"json parse failed \r\n");
            }
            result = [json objectForKey:@"jsonKey"];
        }
        
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            /**
             *  通知主线程刷新
             */
            self.infoLabel.text = result;
            
        });
        
    });
    
    
    [self.view addSubview:self.infoLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}