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
    
    // set initial state of buttons
    self.backButton.enabled = NO;
    self.forwardButton.enabled = NO;
    self.stopButton.enabled = NO;
    self.reloadButton.enabled = NO;
    
//    [self.urlTextField becomeFirstResponder]; 
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.activityIndicator startAnimating];
    self.stopButton.enabled = YES;
    self.reloadButton.enabled = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.activityIndicator stopAnimating];
    [self updateButtons];
    self.stopButton.enabled = NO;
    
}

- (void)updateButtons{
    // back button
    if (self.webView.canGoBack)
    {
        self.backButton.enabled = YES;
        
    }
    else
    {
        self.backButton.enabled = NO;
    }
    
    // forward button
    if (self.webView.canGoForward)
    {
        self.forwardButton.enabled = YES;
        
    }
    else
    {
        self.forwardButton.enabled = NO;
    }
    
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
- (IBAction)newFeatureButton:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Comming Soon!"
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             //cancel
                                                         }];
    [alertController addAction:cancelButton];
    
    [self presentViewController:alertController
                       animated:YES
                     completion:nil];

}

- (IBAction)backButton:(id)sender
{
    [self.webView goBack];
}

- (IBAction)forwardButton:(id)sender {
    [self.webView goForward];
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
