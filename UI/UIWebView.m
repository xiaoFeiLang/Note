//
//  UIWebView.m
//  Note
//
//  Created by loulou on 16/6/29.
//
//

#import <Foundation/Foundation.h>

加载URL内容

NSURL *url = [NSURL URLWithString:@"http://www.jianshu.com/users/1a9cd48c3cf0/latest_articles"];
[self.webview loadRequest:[NSURLRequest requestWithURL:url]];

加载本地Html
NSString *htmlPath = [[[NSBundle mainBundle] bundlePath]
                      stringByAppendingPathComponent:@"wanglongshuai.html"];
[self.webview loadRequest:[NSURLRequest requestWithURL:
                           [NSURL fileURLWithPath:htmlPath]]];

加载Html字符串

NSString *htmlPath = [[[NSBundle mainBundle] bundlePath]
                      stringByAppendingPathComponent:@"wanglongshuai.html"];

NSString *htmlString = [NSString stringWithContentsOfFile: htmlPath
                                                 encoding:NSUTF8StringEncoding
                                                    error:NULL];
[self.webview loadHTMLString:htmlString baseURL:[NSURL
                                                 fileURLWithPath:htmlPath]];

获取UIWebView的显示内容的高度

-(void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1000)];
    _webView.delegate = self;
    [self.view addSubview: _webView];
    _webView.scalesPageToFit = YES;
    
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"file:///Users/ksang/Desktop/html5%E4%B8%87%E4%BF%A1%E5%81%A5%E5%BA%B7-%E6%96%87%E7%AB%A0%E5%86%85%E5%AE%B9%E9%A1%B5/m-newsContent.html"]];
    [_webView loadRequest:request];
}


-(void)webViewDidFinishLoad:(UIWebView *)webView{
    CGFloat sizeHeight = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight;"] floatValue];
    NSLog(@"contentWebView sizeHeight====%f",sizeHeight * 0.5);
    webView.frame = CGRectMake(0, 0, self.view.frame.size.width, sizeHeight * 0.5);
}
