//
//  CheckManTableViewController.h
//  PageViewDemo
//
//  Created by younghwan moon on 6/4/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "WLSectionHeaderView.h"

@interface CheckManTableViewController : UITableViewController<UITableViewDataSource, WLSectionHeaderViewDelegate>{
    
    NSMutableArray  *JournalDate;
    NSMutableSet    *JournalDateSet;
    NSMutableArray  *JournalLocation;
    int rowNum;
    int nowPage;
}

@property (nonatomic,strong) NSArray *photos;
@property (weak, nonatomic) IBOutlet UILabel *date;

@property (nonatomic,assign) NSInteger openSectionIndex;
@property (nonatomic,strong) NSMutableArray *arrayOfSectionHeaders;
@property (nonatomic,strong) NSMutableDictionary *dataDict;

+ (ALAssetsLibrary *)defaultAssetsLibrary;

@end
