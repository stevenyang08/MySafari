//
//  WebViewController.m
//  MySafari
//
//  Created by Andrew Miller on 1/12/16.
//  Copyright © 2016 Steven Yang. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.urlTextField becomeFirstResponder]; 
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.activityIndicator stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)urlTextField{
    NSURL *url = [NSURL URLWithString:self.urlTextField.text];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];

    return YES;
};
- (IBAction)backButton:(id)sender {
    [self.webView goBack];
}

- (IBAction)forwardButton:(id)sender {
    [self.webView goForward];
}

- (IBAction)stopButton:(UIButton *)sender {
    [self.webView stopLoading];
}

- (IBAction)reloadButton:(UIButton *)sender {
    [self.webView reload];
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
