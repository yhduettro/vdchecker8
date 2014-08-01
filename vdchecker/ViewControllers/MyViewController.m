//
//  MyViewController.m
//  vdchecker
//
//  Created by younghwan moon on 6/8/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "MyViewController.h"
#import "ResultAViewController.h"

@interface MyViewController()

@end

@implementation MyViewController

- (void)viewDidLoad
{
	self.view.backgroundColor = [UIColor whiteColor];

    UINavigationBar *naviBar = [self.navigationController navigationBar];
    UIImage *img = [UIImage imageNamed:@"topbar_ichiran.png"];
    [naviBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];

	[scrollView2 setBackgroundColor:[UIColor whiteColor]];
	[scrollView2 setCanCancelContentTouches:NO];
	scrollView2.clipsToBounds = YES;	// default is NO, we want to restrict drawing within our scrollview
	scrollView2.indicatorStyle = UIScrollViewIndicatorStyleWhite;

	UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ichiran.png"]];
    
	[scrollView2 addSubview:imageView];
	[scrollView2 setContentSize:CGSizeMake(imageView.frame.size.width, imageView.frame.size.height)];
	[scrollView2 setScrollEnabled:YES];
}

- (void)didReceiveMemoryWarning
{
	// invoke super's implementation to do the Right Thing, but also release the input controller since we can do that	
	// In practice this is unlikely to be used in this application, and it would be of little benefit,
	// but the principle is the important thing.
	//
	[super didReceiveMemoryWarning];
}

@end

