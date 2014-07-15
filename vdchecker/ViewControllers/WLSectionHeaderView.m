//
//  SectionHeaderView.m
//
//  Created by younghwan moon on 6/3/14.
//  Copyright (c) 2014 wanderlust. All rights reserved.
//

#import "WLSectionHeaderView.h"
#import <QuartzCore/QuartzCore.h>

@interface WLSectionHeaderView()
 

@end
@implementation WLSectionHeaderView
 
-(id)initWithFrame:(CGRect)frame title:(NSString*)title section:(NSInteger)sectionNumber delegate:(id <WLSectionHeaderViewDelegate>)delegate numrow:(NSInteger)numofRows withManOrWomen:(NSInteger)manWoman{
    self = [super initWithFrame:frame];
    if (self != nil) {
        // Set up the tap gesture recognizer.
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleOpen:)];
        [self addGestureRecognizer:tapGesture];
        _delegate = delegate;        
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor whiteColor];
        self.numberOfRows=numofRows;
        self.key=title;
        UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height - 1)];
        redView.backgroundColor = [UIColor clearColor];
        [self addSubview:redView];
        // Create and configure the title label.
        self.section = sectionNumber;
        self.expanded=NO; //start colapsed
//        CGRect titleLabelFrame = self.bounds;
//        titleLabelFrame.origin.x += 5.0;
//        titleLabelFrame.size.width -= 35.0;
//        CGRectInset(titleLabelFrame, 0.0, 5.0);
//        self.titleLabel = [[UILabel alloc] initWithFrame:titleLabelFrame];
//        self.titleLabel.text = title;
//        self.titleLabel.font = [UIFont systemFontOfSize:20];
//        self.titleLabel.textColor = [UIColor whiteColor];
//        self.titleLabel.backgroundColor = [UIColor clearColor];
//        [self addSubview:self.titleLabel];
       
         // Create and configure the disclosure button.
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];

        button1.frame = CGRectMake(0.0, 0.0, 320.0, 40.0);
        button2.frame = CGRectMake(0.0, 0.0, 159.0, 40.0);
        button3.frame = CGRectMake(160.0, 0.0, 160.0, 40.0);
        button4.frame = CGRectMake(0.0, 0.0, 320.0, 160.0);
        
        if (sectionNumber == 1) {
            [button1 setImage:[UIImage imageNamed:@"atama.png"] forState:UIControlStateNormal];
            [button1 setImage:[UIImage imageNamed:@"atama.png"] forState:UIControlStateSelected];
            [button1 addTarget:self action:@selector(toggleOpen:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button1];
            self.disclosureButton1 = button1;
            
            self.numberOfRows = 3;

        } else if (sectionNumber == 2) {
            [button2 setImage:[UIImage imageNamed:@"me.png"] forState:UIControlStateNormal];
            [button2 setImage:[UIImage imageNamed:@"me.png"] forState:UIControlStateSelected];
            button2.backgroundColor=[UIColor blueColor];
            [button2 addTarget:self action:@selector(toggleOpen:) forControlEvents:UIControlEventTouchUpInside];
            [button3 setImage:[UIImage imageNamed:@"kuchi.png"] forState:UIControlStateNormal];
            [button3 setImage:[UIImage imageNamed:@"kuchi.png"] forState:UIControlStateSelected];
            button3.backgroundColor=[UIColor blueColor];
            [button3 addTarget:self action:@selector(toggleOpen:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button2];
            [self addSubview:button3];
            self.disclosureButton1 = button3;
            
            self.numberOfRows = 4;

        } else if (sectionNumber == 3) {
            [button2 setImage:[UIImage imageNamed:@"nodo.png"] forState:UIControlStateNormal];
            [button2 setImage:[UIImage imageNamed:@"nodo.png"] forState:UIControlStateSelected];
            button2.backgroundColor=[UIColor blueColor];
            [button2 addTarget:self action:@selector(toggleOpen:) forControlEvents:UIControlEventTouchUpInside];
            [button3 setImage:[UIImage imageNamed:@"waki.png"] forState:UIControlStateNormal];
            [button3 setImage:[UIImage imageNamed:@"waki.png"] forState:UIControlStateSelected];
            button3.backgroundColor=[UIColor blueColor];
            [button3 addTarget:self action:@selector(toggleOpen:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button2];
            [self addSubview:button3];
            self.disclosureButton1 = button3;
            
            self.numberOfRows = 4;
            
        } else if (sectionNumber == 4) {
            [button1 setImage:[UIImage imageNamed:@"hara.png"] forState:UIControlStateNormal];
            [button1 setImage:[UIImage imageNamed:@"hara.png"] forState:UIControlStateSelected];
            [button1 addTarget:self action:@selector(toggleOpen:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button1];
            self.disclosureButton1 = button1;
            
            self.numberOfRows = 3;
            
        } else if (sectionNumber == 5) {
            [button1 setImage:[UIImage imageNamed:@"inbu.png"] forState:UIControlStateNormal];
            [button1 setImage:[UIImage imageNamed:@"inbu.png"] forState:UIControlStateSelected];
            [button1 addTarget:self action:@selector(toggleOpen:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button1];
            self.disclosureButton1 = button1;
            
            self.numberOfRows = 23;
            
        } else if (sectionNumber == 6) {
            [button2 setImage:[UIImage imageNamed:@"nyou_ben.png"] forState:UIControlStateNormal];
            [button2 setImage:[UIImage imageNamed:@"nyou_ben.png"] forState:UIControlStateSelected];
            button2.backgroundColor=[UIColor blueColor];
            [button2 addTarget:self action:@selector(toggleOpen:) forControlEvents:UIControlEventTouchUpInside];
            [button3 setImage:[UIImage imageNamed:@"koumon.png"] forState:UIControlStateNormal];
            [button3 setImage:[UIImage imageNamed:@"koumon.png"] forState:UIControlStateSelected];
            button3.backgroundColor=[UIColor blueColor];
            [button3 addTarget:self action:@selector(toggleOpen:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button2];
            [self addSubview:button3];
            self.disclosureButton1 = button3;
            
            self.numberOfRows = 12;

        } else if (sectionNumber == 7) {
            [button1 setImage:[UIImage imageNamed:@"ashi.png"] forState:UIControlStateNormal];
            [button1 setImage:[UIImage imageNamed:@"ashi.png"] forState:UIControlStateSelected];
            [button1 addTarget:self action:@selector(toggleOpen:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button1];
            self.disclosureButton1 = button1;
            
            self.numberOfRows = 8;
            
        } else if (sectionNumber == 0) {

            if (manWoman == 1) {
                [button4 setImage:[UIImage imageNamed:@"Section_Man.png"] forState:UIControlStateNormal];
                [button4 setImage:[UIImage imageNamed:@"Section_Man.png"] forState:UIControlStateSelected];
            } else if (manWoman == 0) {
                [button4 setImage:[UIImage imageNamed:@"Section_Woman.png"] forState:UIControlStateNormal];
                [button4 setImage:[UIImage imageNamed:@"Section_Woman.png"] forState:UIControlStateSelected];
            }
            [button4 addTarget:self action:@selector(toggleOpen:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button4];
            self.disclosureButton1 = button4;
            
            self.numberOfRows = 0;
        }
    }
    return self;
}


-(IBAction)toggleOpen:(id)sender
{
    [self toggleOpenWithUserAction:YES];
}

-(void)toggleOpenWithUserAction:(BOOL)userAction
{
    if (self.section == 0) {
        return;
    }
    // Toggle the disclosure button state.
    self.disclosureButton1.selected = !self.disclosureButton1.selected;
    // If this was a user action, send the delegate the appropriate message.
    if (userAction) {
        if (self.disclosureButton1.selected) {
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:sectionOpened:)]) {
                self.expanded=YES;
                [self.delegate sectionHeaderView:self sectionOpened:self.section];
            }
        }
        else {
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:sectionClosed:)]) {
                self.expanded=NO;
                [self.delegate sectionHeaderView:self sectionClosed:self.section];
            }
        }
    }
}
@end