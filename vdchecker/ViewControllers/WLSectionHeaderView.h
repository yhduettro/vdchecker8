//
//  SectionHeaderView.h
//
//  Created by younghwan moon on 6/3/14.
//  Copyright (c) 2014 wanderlust. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WLSectionHeaderViewDelegate;
@interface WLSectionHeaderView : UIView
 
@property (nonatomic,assign) BOOL expanded;
@property (nonatomic,retain) UILabel *titleLabel;
@property (nonatomic,retain) UIButton *disclosureButton1;
@property (nonatomic,assign) NSInteger section;
@property (nonatomic,assign) NSInteger numberOfRows;
@property (nonatomic,retain) NSString *key;
@property (nonatomic,assign) id <WLSectionHeaderViewDelegate> delegate;
//initializer
-(id)initWithFrame:(CGRect)frame title:(NSString*)title section:(NSInteger)sectionNumber delegate:(id <WLSectionHeaderViewDelegate>)delegate numrow:(NSInteger)numofRows withManOrWomen:(NSInteger)manWoman;
-(void)toggleOpenWithUserAction:(BOOL)userAction;
@end

@protocol WLSectionHeaderViewDelegate <NSObject>
@optional
-(void)sectionHeaderView:(WLSectionHeaderView*)sectionHeaderView sectionOpened:(NSInteger)section;
-(void)sectionHeaderView:(WLSectionHeaderView*)sectionHeaderView sectionClosed:(NSInteger)section;

@end