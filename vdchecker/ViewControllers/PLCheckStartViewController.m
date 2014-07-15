//
//  PLCheckStartViewController.m
//  PageViewDemo
//
//  Created by younghwan moon on 6/21/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "PLCheckStartViewController.h"

@interface PLCheckStartViewController ()

@end

@implementation PLCheckStartViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UINavigationBar *naviBar = [self.navigationController navigationBar];
    UIImage *img = [UIImage imageNamed:@"topbar_check_1.png"];
    [naviBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
//    naviBar.backgroundColor = [UIColor clearColor];
    naviBar.hidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)returnedToRecheck:(UIStoryboardSegue *)segue {
    
}

@end
