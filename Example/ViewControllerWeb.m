//
//  ViewControllerWeb.m
//  YangRoute
//
//  Created by yanghuang on 17/3/3.
//  Copyright © 2017年 com.yang. All rights reserved.
//

#import "ViewControllerWeb.h"
#import "YangAppDelegate.h"
@import YangRoute;
@interface ViewControllerWeb ()

@end

@implementation ViewControllerWeb

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    __weak typeof(self) weakSelf = self;
    self.webView.delegate = weakSelf;
    [self.view addSubview:self.webView];
    
    [self refresh];
    
    // Listen for a JS event.
    [Jockey on:@"jump" perform:^(NSDictionary *payload) {
        [[YangRoute shareRoute]performActionWithRouteParams:payload completion:^(id error, id callBackObject) {
            if(!error) {
                NSLog(@"跳转成功");
            } else {
                NSLog(@"跳转异常");
            }
        }];
    }];
    
    [Jockey on:@"toggle-back" perform:^(NSDictionary *payload) {
        [_UI popViewControllerAnimated:YES];
    }];
    
    [Jockey on:@"toggle-talk-with-callback" performAsync:^(UIWebView *webView, NSDictionary *payload, void (^complete)()) {
        
        NSString *text = [payload objectForKey:@"text"];
        NSDictionary *param = @{@"response": [NSString stringWithFormat:@"你说：%@  我回答什么好呢?",text]};
        [Jockey send:@"toggle-talk-response" withPayload:param toWebView:weakSelf.webView];
        complete();
        
    }];
}


- (void)refresh {
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    
    NSString *path = [[NSBundle mainBundle] bundlePath];
    
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:htmlString baseURL:baseURL];
}


-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return [Jockey webView:self.webView withUrl:[request URL]];
}

-(void)dealloc {

    self.webView.delegate = nil;
    [self.webView stopLoading];
    self.webView = nil;
    [Jockey off:@"jump"];
    [Jockey off:@"toggle-back"];
    [Jockey off:@"toggle-talk-with-callback"];
}

@end
