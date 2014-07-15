//
//  GaiyouTableViewController.m
//  PageViewDemo
//
//  Created by younghwan moon on 6/8/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "GaiyouTableViewController.h"
#import "TiryouTableViewController.h"
#import "KennsaKitViewController.h"

@interface GaiyouTableViewController ()
@property (strong, nonatomic) IBOutlet UILabel *illName;
@property (strong, nonatomic) IBOutlet UITextView *illAbstract;
@property (strong, nonatomic) IBOutlet UITextView *illAction;
@property (strong, nonatomic) IBOutlet UITextView *illsymptoms;
@property (strong, nonatomic) IBOutlet UITextView *IncubationPeriod;
@end

@implementation GaiyouTableViewController

//- (id)initWithStyle:(UITableViewStyle)style
//{
//    self = [super initWithStyle:style];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self getDisplayMessage:@"illAction"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    UINavigationBar *naviBar = [self.navigationController navigationBar];
    UIImage *img = [UIImage imageNamed:@"topbar_kekka_3.png"];
    [naviBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

//病名と治療法を取得するメソッド
- (NSString *)getDisplayMessage:(NSString *)illInfoKey
{
    NSString *message;
    self.illName.text = [self.illInfo objectForKey:@"illName"];
    self.illAbstract.text = [self.illInfo objectForKey:@"illAbstract"];
    self.illAction.text = [self.illInfo objectForKey:@"illAction"];
    self.illsymptoms.text = [self.illInfo objectForKey:@"illsymptoms"];
    self.IncubationPeriod.text = [self.illInfo objectForKey:@"IncubationPeriod"];
//    message = [self.illInfo objectForKey:@"countermeasures"];
//    message = [self.illInfo objectForKey:@"visitFamily"];
//    message = [self.illInfo objectForKey:@"costOfTherapy"];
//    message = [self.illInfo objectForKey:@"treatmentPeriod"];
//    message = [self.illInfo objectForKey:@"verificationOfPartner"];
//    message = [self.illInfo objectForKey:@"Over-the-counter drug"];
    
    message = [self.illInfo objectForKey:illInfoKey];
    NSLog(@"%@", message);
    
    return message;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"showIllCareMethod2"]) {
        TiryouTableViewController *vcntl = [segue destinationViewController];  // <- 1
        vcntl.illInfo = [self.illInfo copy];
    } else if ([[segue identifier] isEqualToString:@"kensaKit"]) {
        KennsaKitViewController *vcntl = [segue destinationViewController];  // <- 1
        vcntl.illInfo = [self.illInfo copy];
    }
}

@end
