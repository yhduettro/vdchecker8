//
//  ResultAViewController.m
//  PageViewDemo
//
//  Created by younghwan moon on 6/11/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "ResultAViewController.h"
#import "ResultBViewController.h"

@interface ResultAViewController ()
{
    NSMutableArray *aMArray;
}
@end

@implementation ResultAViewController

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
    
    UINavigationBar *naviBar = [self.navigationController navigationBar];
    UIImage *img = [UIImage imageNamed:@"topbar_kekka_1.png"];
    [naviBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    
    // Do any additional setup after loading the view.

    //read file
    if (self.manWoman) {
        if (self.illInfoSection==1) {
            [self getIllNoOfMan1];
        } else if (self.illInfoSection==2) {
            [self getIllNoOfMan2];
        } else if (self.illInfoSection==3) {
            [self getIllNoOfMan3];
        } else if (self.illInfoSection==4) {
            [self getIllNoOfMan4];
        } else if (self.illInfoSection==5) {
            [self getIllNoOfMan5];
        } else if (self.illInfoSection==6) {
            [self getIllNoOfMan6];
        } else if (self.illInfoSection==7) {
            [self getIllNoOfMan7];
        }
    } else {
        if (self.illInfoSection==1) {
            [self getIllNoOfWoman1];
        } else if (self.illInfoSection==2) {
            [self getIllNoOfWoman2];
        } else if (self.illInfoSection==3) {
            [self getIllNoOfWoman3];
        } else if (self.illInfoSection==4) {
            [self getIllNoOfWoman4];
        } else if (self.illInfoSection==5) {
            [self getIllNoOfWoman5];
        } else if (self.illInfoSection==6) {
            [self getIllNoOfWoman6];
        } else if (self.illInfoSection==7) {
            [self getIllNoOfWoman7];
        }
    }
    NSLog(@"%ld", (long)self.manWoman);
    NSLog(@"%ld", (long)self.illInfoSection);
    NSLog(@"%ld", (long)self.illInfoRow);
    NSLog(@"%@", aMArray);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UINavigationBar *naviBar = [self.navigationController navigationBar];
    UIImage *img = [UIImage imageNamed:@"topbar_kekka_1.png"];
    [naviBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    naviBar.backgroundColor = [UIColor clearColor];
    naviBar.hidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getIllNoOfMan1
{
    switch (self.illInfoRow) {
        case 0:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:5], nil];
            break;
        case 1:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:15], nil];
            break;
        case 3:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:15], nil];
            break;
        default:
            break;
    }
}
- (void)getIllNoOfMan2
{
    switch (self.illInfoRow) {
        case 0:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:17],[NSNumber numberWithInt:18],[NSNumber numberWithInt:19], nil];
            break;
        case 1:
        case 2:
        case 3:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:9], nil];
            break;        default:
            break;
    }
}
- (void)getIllNoOfMan3
{
    switch (self.illInfoRow) {
        case 0:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:4],[NSNumber numberWithInt:6], nil];
            break;
        case 1:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:4], nil];
            break;
        case 2:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:8], nil];
            break;
        case 3:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:5],[NSNumber numberWithInt:2], nil];
            break;
        default:
            break;
    }
}
- (void)getIllNoOfMan4
{
    switch (self.illInfoRow) {
        case 0:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:17],[NSNumber numberWithInt:8], nil];
            break;
        case 1:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:10],[NSNumber numberWithInt:11], nil];
            break;
        case 2:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:2], nil];
            break;
        default:
            break;
    }
}
- (void)getIllNoOfMan5
{
    switch (self.illInfoRow) {
        case 0:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:2],[NSNumber numberWithInt:5], nil];
            break;
        case 1:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:9], nil];
            break;
        case 2:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:7],[NSNumber numberWithInt:9], nil];
            break;
        case 3:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:7],[NSNumber numberWithInt:9], nil];
            break;
        case 4:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:9],[NSNumber numberWithInt:7], nil];
            break;
        case 5:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:7], nil];
            break;
        case 6:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:9], nil];
            break;
        case 7:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:9],[NSNumber numberWithInt:13],[NSNumber numberWithInt:15], nil];
            break;
        case 8:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:3], nil];
            break;
        case 9:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:13],[NSNumber numberWithInt:15], nil];
            break;
        case 10:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:9],[NSNumber numberWithInt:13],[NSNumber numberWithInt:15], nil];
            break;
        case 11:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:9],[NSNumber numberWithInt:10], nil];
            break;
        case 12:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:9],[NSNumber numberWithInt:10], nil];
            break;
        case 13:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:9], nil];
            break;
        case 14:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:14],[NSNumber numberWithInt:16], nil];
            break;
        case 15:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:4],[NSNumber numberWithInt:11], nil];
            break;
        case 16:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:3], nil];
            break;
        case 17:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:4],[NSNumber numberWithInt:10],[NSNumber numberWithInt:11],[NSNumber numberWithInt:14], nil];
            break;
        case 18:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:16], nil];
            break;
        case 19:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:7], nil];
            break;
        case 20:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:11],[NSNumber numberWithInt:10],[NSNumber numberWithInt:14],[NSNumber numberWithInt:16], nil];
            break;
        case 21:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:11],[NSNumber numberWithInt:10],[NSNumber numberWithInt:12],[NSNumber numberWithInt:14], nil];
            break;
        case 22:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:16], nil];
            break;
        default:
            break;
    }
}
- (void)getIllNoOfMan6
{
    switch (self.illInfoRow) {
        case 0:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:11],[NSNumber numberWithInt:10],[NSNumber numberWithInt:12], nil];
            break;
        case 1:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:11],[NSNumber numberWithInt:16], nil];
            break;
        case 2:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:18],[NSNumber numberWithInt:19], nil];
            break;
        case 3:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:11], nil];
            break;
        case 4:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:10], nil];
            break;
        case 5:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:6],[NSNumber numberWithInt:8],[NSNumber numberWithInt:17], nil];
            break;
        case 6:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:1], nil];
            break;
        case 7:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:8], nil];
            break;
        case 8:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:5], [NSNumber numberWithInt:9], nil];
            break;
        case 9:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:9], nil];
            break;
        case 10:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:9],[NSNumber numberWithInt:13],[NSNumber numberWithInt:15], nil];
            break;
        case 11:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:11],[NSNumber numberWithInt:10], nil];
            break;
        default:
            break;
    }
}
- (void)getIllNoOfMan7
{
    switch (self.illInfoRow) {
        case 0:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:10], nil];
            break;
        case 1:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:10], nil];
            break;
        case 2:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:15], nil];
            break;
        case 3:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:2], [NSNumber numberWithInt:5], nil];
            break;
        case 4:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:2], nil];
            break;
        case 5:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:10], nil];
            break;
        case 6:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:10], nil];
            break;
        case 7:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:7],[NSNumber numberWithInt:13],[NSNumber numberWithInt:15], nil];
            break;
        default:
            break;
    }
}
- (void)getIllNoOfWoman1
{
    [self getIllNoOfMan1];
}
- (void)getIllNoOfWoman2
{
    [self getIllNoOfMan2];
}
- (void)getIllNoOfWoman3
{
    [self getIllNoOfMan3];
}
- (void)getIllNoOfWoman4
{
    switch (self.illInfoRow) {
        case 0:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:17],[NSNumber numberWithInt:8], nil];
            break;
        case 1:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:20], nil];
            break;
        case 2:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:2], nil];
            break;
        default:
            break;
    }
}
- (void)getIllNoOfWoman5
{
    switch (self.illInfoRow) {
        case 0:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:7], nil];
            break;
        case 1:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:9], nil];
            break;
        case 2:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:7],[NSNumber numberWithInt:9],[NSNumber numberWithInt:3], nil];
            break;
        case 3:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:14], nil];
            break;
        case 4:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:13],[NSNumber numberWithInt:15], nil];
            break;
        case 5:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:7], nil];
            break;
        case 6:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:9], nil];
            break;
        case 7:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:9],[NSNumber numberWithInt:13],[NSNumber numberWithInt:15], nil];
            break;
        case 8:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:3], nil];
            break;
        case 9:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:13],[NSNumber numberWithInt:15], nil];
            break;
        case 10:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:9], nil];
            break;
        case 11:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:4],[NSNumber numberWithInt:16], nil];
            break;
        case 12:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:4],[NSNumber numberWithInt:16], nil];
            break;
        case 13:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:3], nil];
            break;
        case 14:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:20], nil];
            break;
        case 15:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:14], nil];
            break;
        case 16:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:14], nil];
            break;
        case 17:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:14], nil];
            break;
        default:
            break;
    }
}
- (void)getIllNoOfWoman6
{
    switch (self.illInfoRow) {
        case 0:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:20],[NSNumber numberWithInt:14], nil];
            break;
        case 1:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:6],[NSNumber numberWithInt:8],[NSNumber numberWithInt:17], nil];
            break;
        case 2:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:1], nil];
            break;
        case 3:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:8], nil];
            break;
        case 4:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:5], [NSNumber numberWithInt:9], nil];
            break;
        case 5:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:9], nil];
            break;
        case 6:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:9],[NSNumber numberWithInt:13],[NSNumber numberWithInt:15], nil];
            break;
        default:
            break;
    }
}
- (void)getIllNoOfWoman7
{
    switch (self.illInfoRow) {
        case 0:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:7], nil];
            break;
        case 1:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:13], nil];
            break;
        case 2:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:15], nil];
            break;
        case 3:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:2], [NSNumber numberWithInt:5],nil];
            break;
        case 4:
            aMArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:7],[NSNumber numberWithInt:13],[NSNumber numberWithInt:15], nil];
            break;
        default:
            break;
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"showIllNameAndDigest"]) {
        ResultBViewController *vcntl = [segue destinationViewController];  // <- 1
        vcntl.bMArray = [aMArray copy];
    }
}

-(IBAction)returned:(UIStoryboardSegue *)segue {

}

@end
