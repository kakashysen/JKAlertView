//
//  ViewController.m
//  JKAlertView
//
//  Created by Jose Aponte on 10/4/16.
//  Copyright © 2016 jappsku. All rights reserved.
//

#import "ViewController.h"
#import "JKAlertView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showAlertAction:(id)sender
{
    JKAlertView *alertView = [[JKAlertView alloc] initWithFontName:@"courier"];
    alertView.headerImage = [UIImage imageNamed:@"bg_img.jpg"];
    alertView.titleText = @"The Git";
    alertView.detailText = @"Is a version control system that is used for software development and other version control tasks.";
    alertView.linkText = @"git-scm";
    alertView.url = @"itms-apps://itunes.apple.com/co/app/tappsi/id562064313?ls=1&mt=8";
    alertView.footerText = @"Wikipedia";
    
    [alertView.linkButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [alertView.linkButton setBackgroundImage:[UIImage imageNamed:@"btn_vermapa"] forState:UIControlStateNormal];
    [alertView show];
}
- (IBAction)showCustomAlertAction:(id)sender
{
    JKAlertView *alertView = [[JKAlertView alloc] initWithFontName:@"verdana"];
    alertView.headerImage = [UIImage imageNamed:@"dbz.jpg"];
    alertView.url = @"https://en.wikipedia.org/wiki/Goku";
    alertView.backgroundContentColor = [UIColor orangeColor];
    alertView.titleText = @"DBZ";
    alertView.linkText = @"Son Goku";
    alertView.detailText = @"Is a fictional character and main protagonist of the Dragon Ball manga series created by Akira Toriyama. He is based on Sun Wukong.";
    alertView.footerText = @"Source - Wikipedia";
    alertView.titleTextColor = [UIColor whiteColor];
    alertView.detailTextColor = [UIColor whiteColor];
    alertView.footerTextColor = [UIColor whiteColor];
    alertView.linkTextColor = [UIColor blueColor];
    
    [alertView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
