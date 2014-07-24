//
//  PageContentViewController.h
//  vdchecker
//
//  Created by younghwan moon on 6/21/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *buttonCheckStart;
@property (weak, nonatomic) IBOutlet UIButton *buttonIllList;
@property (weak, nonatomic) IBOutlet UIButton *buttonToExpert;

@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;
@end
