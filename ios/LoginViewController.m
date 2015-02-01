//
//  LoginViewController.m
//  ios
//
//  Created by Simon on 1/02/2015.
//  Copyright (c) 2015 sbhstimetable.tk. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSHTTPCookieStorage sharedHTTPCookieStorage].cookieAcceptPolicy =
    NSHTTPCookieAcceptPolicyAlways;

    [NSClassFromString(@"WebView") performSelector:@selector(_enableRemoteInspector)];
    // Do any additional setup after loading the view.
    [self.webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://sbhstimetable.tk/try_do_oauth"]]];
    [self.webView setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString *urlString = [[request URL]absoluteString];

    NSLog(@"Navigate to: %@", urlString);
    if ([urlString isEqualToString:@"http://sbhstimetable.tk/"]) {
        NSLog(@"Found the end result!");
        NSArray *ary = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:@"http://sbhstimetable.tk/"]];
        for (int i = 0; i < ary.count; i++) {
            NSHTTPCookie *c = ary[i];
            if ([c.name  isEqualToString:@"SESSID"]) {
                NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
                [prefs setObject:c.value forKey:@"sessionID"];
                NSLog(@"Got session ID, now launching main window...");
                AppDelegate *appDelegateTemp = [[UIApplication sharedApplication]delegate];
                
                appDelegateTemp.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController];

            }
        }
    }
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}

- (void) webViewDidStartLoad:(UIWebView *)webView {
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
