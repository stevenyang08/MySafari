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
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UIButton *reloadButton;
@property (weak, nonatomic) IBOutlet UIButton *forwardButton;

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

- (BOOL)textFieldShouldReturn:(UITextField *)urlTextField
{
    if ([self.urlTextField.text hasPrefix:@"http://"])
    {
        NSURL *url = [NSURL URLWithString:self.urlTextField.text];
        [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    }
    else
    {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", self.urlTextField.text]];
        [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    }



    return YES;
};
- (IBAction)backButton:(id)sender
{
    if (self.webView.canGoBack)
    {
        [self.webView goBack];
    }
    else
    {
        self.backButton.enabled = NO;
    }
}

- (IBAction)forwardButton:(id)sender {
    if (self.webView.canGoForward)
    {
        [self.webView goForward];
    }
    else
    {
        self.forwardButton.enabled = NO;
    }
}

- (IBAction)stopButton:(UIButton *)sender {
    [self.webView stopLoading];
    //
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
