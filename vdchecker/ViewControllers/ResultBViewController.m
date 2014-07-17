//
//  ResultBViewController.m
//  vdchecker
//
//  Created by younghwan moon on 6/28/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "ResultBViewController.h"
#import "GaiyouTableViewController.h"
#import "TiryouTableViewController.h"

@interface ResultBViewController ()
{
    NSDictionary *illInfo;
}
@property (nonatomic, weak) IBOutlet UILabel *illName;
@property (nonatomic, weak) IBOutlet UITextView *illetcName;
@end

@implementation ResultBViewController

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
    // Do any additional setup after loading the view.
    
    NSLog(@"%@", self.bMArray);
//    [self getToDoMessage:[[self.bMArray objectAtIndex:0] intValue]];
    self.illName.text = [self getToDoMessage:[[self.bMArray objectAtIndex:0] intValue]];
    
    NSString *aString1 = @" ";
    switch ([self.bMArray count]) {
        case 10:
            aString1 = [[self getToDoMessage:[[self.bMArray objectAtIndex:9] intValue]]  stringByAppendingString:[NSString stringWithFormat:@"\n%@",aString1]];
        case 9:
            aString1 = [[self getToDoMessage:[[self.bMArray objectAtIndex:8] intValue]]  stringByAppendingString:[NSString stringWithFormat:@"\n%@",aString1]];
        case 8:
            aString1 = [[self getToDoMessage:[[self.bMArray objectAtIndex:7] intValue]]  stringByAppendingString:[NSString stringWithFormat:@"\n%@",aString1]];
        case 7:
            aString1 = [[self getToDoMessage:[[self.bMArray objectAtIndex:6] intValue]]  stringByAppendingString:[NSString stringWithFormat:@"\n%@",aString1]];
        case 6:
            aString1 = [[self getToDoMessage:[[self.bMArray objectAtIndex:5] intValue]]  stringByAppendingString:[NSString stringWithFormat:@"\n%@",aString1]];
        case 5:
            aString1 = [[self getToDoMessage:[[self.bMArray objectAtIndex:4] intValue]]  stringByAppendingString:[NSString stringWithFormat:@"\n%@",aString1]];
        case 4:
            aString1 = [[self getToDoMessage:[[self.bMArray objectAtIndex:3] intValue]]  stringByAppendingString:[NSString stringWithFormat:@"\n%@",aString1]];
        case 3:
            aString1 = [[self getToDoMessage:[[self.bMArray objectAtIndex:2] intValue]]  stringByAppendingString:[NSString stringWithFormat:@"\n%@",aString1]];
        case 2:
            aString1 = [[self getToDoMessage:[[self.bMArray objectAtIndex:1] intValue]]  stringByAppendingString:[NSString stringWithFormat:@"\n%@",aString1]];
        default:
            self.illetcName.text = aString1;
            break;
    }
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

//病名と治療法を取得するメソッド
- (NSString *)getToDoMessage:(NSInteger)illNo
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ill_Info.txt" ofType:nil];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    NSLog(@"%@", jsonObject);
    
    NSMutableString *message = [NSMutableString stringWithCapacity:40000];
    NSArray *notify_info = jsonObject[@"ill_Info"];
    
    for(NSDictionary *aInfo in notify_info){
        NSInteger aIllNo = [[aInfo objectForKey:@"illNo"] intValue];
        NSLog(@"%ld - %ld", (long)aIllNo, (long)illNo);
        if (aIllNo == illNo) {
            illInfo = [aInfo copy];
            message = [aInfo objectForKey:@"illName"];
//            message = [aInfo objectForKey:@"illAbstract"];
//            message = [aInfo objectForKey:@"illAction"];
//            message = [aInfo objectForKey:@"illsymptoms"];
//            message = [aInfo objectForKey:@"IncubationPeriod"];
//            message = [aInfo objectForKey:@"countermeasures"];
//            message = [aInfo objectForKey:@"visitFamily"];
//            message = [aInfo objectForKey:@"costOfTherapy"];
//            message = [aInfo objectForKey:@"treatmentPeriod"];
//            message = [aInfo objectForKey:@"verificationOfPartner"];
//            message = [aInfo objectForKey:@"Over-the-counter drug"];
            NSLog(@"%@", message);
            break;
        }
    }
    return message;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"showIllDescription"]) {
        GaiyouTableViewController *vcntl = [segue destinationViewController];  // <- 1
        vcntl.illInfo = [illInfo copy];
    } else if ([[segue identifier] isEqualToString:@"showIllCareMethod"]) {
        TiryouTableViewController *vcntl = [segue destinationViewController];  // <- 1
        vcntl.illInfo = [illInfo copy];
    }
}

@end
