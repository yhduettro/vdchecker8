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

//@synthesize scrollView1, scrollView2;

//const CGFloat kScrollObjHeight	= 199.0;
//const CGFloat kScrollObjWidth	= 280.0;
//const NSUInteger kNumImages		= 5;


- (void)layoutScrollImages
{
//	UIImageView *view = nil;
//	NSArray *subviews = [scrollView1 subviews];
//
//	// reposition all image subviews in a horizontal serial fashion
//	CGFloat curXLoc = 0;
//	for (view in subviews)
//	{
//		if ([view isKindOfClass:[UIImageView class]] && view.tag > 0)
//		{
//			CGRect frame = view.frame;
//			frame.origin = CGPointMake(curXLoc, 0);
//			view.frame = frame;
//			
//			curXLoc += (kScrollObjWidth);
//		}
//	}
//	
//	// set the content size so it can be scrollable
//	[scrollView1 setContentSize:CGSizeMake((kNumImages * kScrollObjWidth), [scrollView1 bounds].size.height)];
}

- (void)viewDidLoad
{
	self.view.backgroundColor = [UIColor whiteColor];

    UINavigationBar *naviBar = [self.navigationController navigationBar];
    UIImage *img = [UIImage imageNamed:@"topbar_ichiran.png"];
    [naviBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    
	// 1. setup the scrollview for multiple images and add it to the view controller
	//
	// note: the following can be done in Interface Builder, but we show this in code for clarity
//	[scrollView1 setBackgroundColor:[UIColor blackColor]];
//	[scrollView1 setCanCancelContentTouches:NO];
//	scrollView1.indicatorStyle = UIScrollViewIndicatorStyleWhite;
//	scrollView1.clipsToBounds = YES;		// default is NO, we want to restrict drawing within our scrollview
//	scrollView1.scrollEnabled = YES;
//	
//	// pagingEnabled property default is NO, if set the scroller will stop or snap at each photo
//	// if you want free-flowing scroll, don't set this property.
//	scrollView1.pagingEnabled = YES;
//	
//	// load all the images from our bundle and add them to the scroll view
//	NSUInteger i;
//	for (i = 1; i <= kNumImages; i++)
//	{
//		NSString *imageName = [NSString stringWithFormat:@"image%lu.jpg", i];
//		UIImage *image = [UIImage imageNamed:imageName];
//		UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//		
//		// setup each frame to a default height and width, it will be properly placed when we call "updateScrollList"
//		CGRect rect = imageView.frame;
//		rect.size.height = kScrollObjHeight;
//		rect.size.width = kScrollObjWidth;
//		imageView.frame = rect;
//		imageView.tag = i;	// tag our images for later use when we place them in serial fashion
//		[scrollView1 addSubview:imageView];
//		[imageView release];
//	}
	
//	[self layoutScrollImages];	// now place the photos in serial layout within the scrollview
	
	// 2. setup the scrollview for one image and add it to the view controller
	//
	[scrollView2 setBackgroundColor:[UIColor whiteColor]];
	[scrollView2 setCanCancelContentTouches:NO];
	scrollView2.clipsToBounds = YES;	// default is NO, we want to restrict drawing within our scrollview
	scrollView2.indicatorStyle = UIScrollViewIndicatorStyleWhite;
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ichiran.png"]];
    
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ichiran" ofType:@"png"];
//    NSData *imgData = [NSData dataWithContentsOfFile:filePath];
//	  UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:imgData scale:2.0]];
	UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ichiran.png"]];
    
	[scrollView2 addSubview:imageView];
	[scrollView2 setContentSize:CGSizeMake(imageView.frame.size.width, imageView.frame.size.height)];
	[scrollView2 setScrollEnabled:YES];
//	[imageView release];
}

//- (void)dealloc
//{	
//	[scrollView1 release];
//	[scrollView2 release];
//	
//	[super dealloc];
//}

- (void)didReceiveMemoryWarning
{
	// invoke super's implementation to do the Right Thing, but also release the input controller since we can do that	
	// In practice this is unlikely to be used in this application, and it would be of little benefit,
	// but the principle is the important thing.
	//
	[super didReceiveMemoryWarning];
}

@end

