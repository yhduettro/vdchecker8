//
//  PageContentViewController.m
//  vdchecker
//
//  Created by Simon on 24/11/13.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()
{
    UIImage *backImg;
}

@end

@implementation PageContentViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.backgroundImageView.image = [UIImage imageNamed:self.imageFile];
    self.titleLabel.text = self.titleText;
    self.titleLabel.hidden = YES;   //hidden

    if (self.pageIndex == 3) {
        
        self.buttonCheckStart.hidden = NO;
        self.buttonIllList.hidden = NO;

    } else {

        self.buttonCheckStart.hidden = YES;
        self.buttonIllList.hidden = YES;

    }
    // Do any additional setup after loading the view.
    UINavigationBar *naviBar = [self.navigationController navigationBar];
    backImg = [naviBar backgroundImageForBarMetrics:UIBarMetricsDefault];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    UINavigationBar *naviBar = [self.navigationController navigationBar];
    [naviBar setBackgroundImage:backImg forBarMetrics:UIBarMetricsDefault];
    naviBar.backgroundColor = [UIColor whiteColor];
    
    if (self.pageIndex == 0) {
        naviBar.hidden = NO;
    } else {
        naviBar.hidden = YES;
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    UINavigationBar *naviBar = [self.navigationController navigationBar];
    [naviBar setBackgroundImage:backImg forBarMetrics:UIBarMetricsDefault];
    naviBar.backgroundColor = [UIColor whiteColor];
    if (self.pageIndex == 0) {
        naviBar.hidden = NO;
    } else {
        naviBar.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
