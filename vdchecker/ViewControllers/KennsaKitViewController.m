//
//  KennsaKitViewController.m
//  PageViewDemo
//
//  Created by younghwan moon on 6/11/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "KennsaKitViewController.h"

@interface KennsaKitViewController ()

@end

@implementation KennsaKitViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    UINavigationBar *naviBar = [self.navigationController navigationBar];
//    UIImage *img = [UIImage imageNamed:@"topbar_kensa.png"];
//    [naviBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];

    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UINavigationBar *naviBar = [self.navigationController navigationBar];
    UIImage *img = [UIImage imageNamed:@"topbar_kensa.png"];
    [naviBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
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

@end
