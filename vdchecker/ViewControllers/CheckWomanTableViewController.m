//
//  CheckWomanTableViewController.m
//  PageViewDemo
//
//  Created by younghwan moon on 6/8/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "CheckWomanTableViewController.h"
#import "WLMyJournal.h"
#import "ResultAViewController.h"

@interface CheckWomanTableViewController ()

@end


@implementation CheckWomanTableViewController

@synthesize photos = _photos;
@synthesize date = _date;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    //    _photoListTableView.dataSource = self;
    //    _photoListTableView.delegate = self;
    rowNum = 30;
    nowPage = 1;
    self.tableView.sectionHeaderHeight = HEADER_HEIGHT;
    
    JournalDate = [[NSMutableArray alloc] init];
    JournalDateSet = [[NSMutableSet alloc] init];
    self.dataDict = [[NSMutableDictionary alloc] init];
    
    self.arrayOfSectionHeaders=[[NSMutableArray alloc] init];
    WLSectionHeaderView *make = [[WLSectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, HEADER_HEIGHT) title:nil section:0 delegate:self numrow:0 withManOrWomen:0];
    [self.arrayOfSectionHeaders addObject:make];
    [self.arrayOfSectionHeaders addObject:make];
    [self.arrayOfSectionHeaders addObject:make];
    [self.arrayOfSectionHeaders addObject:make];
    [self.arrayOfSectionHeaders addObject:make];
    [self.arrayOfSectionHeaders addObject:make];
    [self.arrayOfSectionHeaders addObject:make];
    [self.arrayOfSectionHeaders addObject:make];
    
    _date.text = @"画像ロード中...";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UINavigationBar *naviBar = [self.navigationController navigationBar];
    UIImage *img = [UIImage imageNamed:@"topbar_check_2.png"];
    [naviBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    naviBar.backgroundColor = [UIColor clearColor];
    naviBar.hidden = NO;

    // collect the photos
    NSMutableArray *collector = [[NSMutableArray alloc] initWithCapacity:0];
    ALAssetsLibrary *al = [CheckWomanTableViewController defaultAssetsLibrary];
    
    [al enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        [group enumerateAssetsUsingBlock:^(ALAsset *asset, NSUInteger index, BOOL *stop) {
            if (asset) {
                [collector addObject:asset];
            }
        }];
        
        self.photos = collector;
        [self loadData];
    } failureBlock:^(NSError *error) { NSLog(@"ERROR!!!");}
     ];
    
    [super viewWillAppear:animated];
}

-(void)loadData
{
    //Create some models for Atama
    NSArray *atama = [[NSArray alloc] initWithObjects:
                      [[WLMyJournal alloc] initWithMake:@"2nd/Jun/2014" model:@"2013 F-150" imageName:@"2013f150.jpg" photos:self.photos],
                      [[WLMyJournal alloc] initWithMake:@"2nd/Jun/2014" model:@"2013 Super Duty" imageName:@"2013superduty.jpg" photos:self.photos],
                      [[WLMyJournal alloc] initWithMake:@"2nd/Jun/2014" model:@"Shelby GT500" imageName:@"shelbygt500.jpg" photos:self.photos],
                      nil];
    //create some models for Mekuchi
    NSArray *mekuchi = [[NSArray alloc] initWithObjects:
                        [[WLMyJournal alloc] initWithMake:@"3rd/July/2014" model:@"2013 Suburban 3/4 ton" imageName:@"suburban.png" photos:self.photos],
                        [[WLMyJournal alloc] initWithMake:@"3rd/July/2014" model:@"2012 Colorado" imageName:@"colorado.jpg" photos:self.photos],
                        nil];
    //Create some models for Nodowaki
    NSArray *nodowaki = [[NSArray alloc] initWithObjects:
                         [[WLMyJournal alloc] initWithMake:@"2nd/Jun/2014" model:@"2013 F-150" imageName:@"2013f150.jpg" photos:self.photos],
                         [[WLMyJournal alloc] initWithMake:@"2nd/Jun/2014" model:@"2013 Super Duty" imageName:@"2013superduty.jpg" photos:self.photos],
                         [[WLMyJournal alloc] initWithMake:@"2nd/Jun/2014" model:@"Shelby GT500" imageName:@"shelbygt500.jpg" photos:self.photos],
                         nil];
    
    //Create some models for Hara
    NSArray *hara = [[NSArray alloc] initWithObjects:
                     [[WLMyJournal alloc] initWithMake:@"2nd/Jun/2014" model:@"2013 F-150" imageName:@"2013f150.jpg" photos:self.photos],
                     [[WLMyJournal alloc] initWithMake:@"2nd/Jun/2014" model:@"2013 Super Duty" imageName:@"2013superduty.jpg" photos:self.photos],
                     [[WLMyJournal alloc] initWithMake:@"2nd/Jun/2014" model:@"Shelby GT500" imageName:@"shelbygt500.jpg" photos:self.photos],
                     nil];
    
    //create some models for Inbu
    NSArray *inbu = [[NSArray alloc] initWithObjects:
                     [[WLMyJournal alloc] initWithMake:@"3rd/July/2014" model:@"2013 Suburban 3/4 ton" imageName:@"suburban.png" photos:self.photos],
                     [[WLMyJournal alloc] initWithMake:@"3rd/July/2014" model:@"2012 Colorado" imageName:@"colorado.jpg" photos:self.photos],
                     nil];
    
    //create some models for Nyoukoumon
    NSArray *nyoukoumon = [[NSArray alloc] initWithObjects:
                           [[WLMyJournal alloc] initWithMake:@"3rd/July/2014" model:@"2013 Suburban 3/4 ton" imageName:@"suburban.png" photos:self.photos],
                           [[WLMyJournal alloc] initWithMake:@"3rd/July/2014" model:@"2012 Colorado" imageName:@"colorado.jpg" photos:self.photos],
                           nil];
    
    //create some models for Ashi
    NSArray *ashi = [[NSArray alloc] initWithObjects:
                     [[WLMyJournal alloc] initWithMake:@"3rd/July/2014" model:@"2013 Suburban 3/4 ton" imageName:@"suburban.png" photos:self.photos],
                     [[WLMyJournal alloc] initWithMake:@"3rd/July/2014" model:@"2012 Colorado" imageName:@"colorado.jpg" photos:self.photos],
                     nil];
    
    //Create a dictionary to store them
    [self.dataDict setObject:atama forKey:@"atama"];
    [self.dataDict setObject:mekuchi forKey:@"mekuchi"];
    [self.dataDict setObject:nodowaki forKey:@"nodowaki"];
    [self.dataDict setObject:hara forKey:@"hara"];
    [self.dataDict setObject:inbu forKey:@"inbu"];
    [self.dataDict setObject:nyoukoumon forKey:@"nyoukoumon"];
    [self.dataDict setObject:ashi forKey:@"ashi"];
    
    //Create an array of WLSectionHeaderViews with the title and number of rows in it
    //    int sectionNr = 0;
    for (id key in self.dataDict) {
        id anObject = [self.dataDict objectForKey:key];
        
        int sectionNr = 0;
        if ([key isEqualToString:@"atama"]) {
            sectionNr = 1;
        } else if ([key isEqualToString:@"mekuchi"]) {
            sectionNr = 2;
        } else if ([key isEqualToString:@"nodowaki"]) {
            sectionNr = 3;
        } else if ([key isEqualToString:@"hara"]) {
            sectionNr = 4;
        } else if ([key isEqualToString:@"inbu"]) {
            sectionNr = 5;
        } else if ([key isEqualToString:@"nyoukoumon"]) {
            sectionNr = 6;
        } else if ([key isEqualToString:@"ashi"]) {
            sectionNr = 7;
        } else {
            sectionNr = 0;
        }
        
        WLSectionHeaderView *make = [[WLSectionHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320, HEADER_HEIGHT) title:key section:sectionNr delegate:self numrow:[anObject count] withManOrWomen:0];
        [self.arrayOfSectionHeaders setObject:make atIndexedSubscript:sectionNr];
    }

    self.openSectionIndex = NSNotFound;
    
    NSLog(@"photo count = %li",(unsigned long)self.photos.count);
    _date.text = [NSString stringWithFormat:@"%dpage/%dpage",nowPage ,((int)(self.photos.count / (3 * rowNum)) + 1) ];
    
    [self.tableView reloadData];
}

- (void)viewDidUnload
{
    //    [self setPhotoListTableView:nil];
    [self setDate:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma HEADER
-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {
    WLSectionHeaderView *sectionHeaderView  = (WLSectionHeaderView *)[self.arrayOfSectionHeaders objectAtIndex:section];
    return sectionHeaderView;
}
-(void)sectionHeaderView:(WLSectionHeaderView*)sectionHeaderView sectionOpened:(NSInteger)sectionOpened {
    
    if (sectionOpened != NSNotFound) //all sections are closed so we can't do anything
    {
        WLSectionHeaderView *sectionHeaderView = [self.arrayOfSectionHeaders objectAtIndex:sectionOpened];
        sectionHeaderView.expanded = YES;
        /*
         Create an array containing the index paths of the rows to insert: These correspond to the rows for each quotation in the current section.
         */
        NSInteger countOfRowsToInsert = sectionHeaderView.numberOfRows;
        NSMutableArray *indexPathsToInsert = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < countOfRowsToInsert; i++) {
            [indexPathsToInsert addObject:[NSIndexPath indexPathForRow:i inSection:sectionOpened]];
        }
        /*
         Create an array containing the index paths of the rows to delete: These correspond to the rows for each quotation in the previously-open section, if there was one.
         */
        NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
        NSInteger previousOpenSectionIndex =self.openSectionIndex;
        if (previousOpenSectionIndex != NSNotFound) {
            WLSectionHeaderView *previousOpenSectionHeaderView= [self.arrayOfSectionHeaders objectAtIndex:previousOpenSectionIndex];
            previousOpenSectionHeaderView.expanded = NO;
            [previousOpenSectionHeaderView toggleOpenWithUserAction:NO];
            NSInteger countOfRowsToDelete = previousOpenSectionHeaderView.numberOfRows;
            for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
                [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:previousOpenSectionIndex]];
            }
        }
        
        // Style the animation so that there's a smooth flow in either direction.
        UITableViewRowAnimation insertAnimation;
        UITableViewRowAnimation deleteAnimation;
        if (previousOpenSectionIndex == NSNotFound || sectionOpened < previousOpenSectionIndex) {
            insertAnimation = UITableViewRowAnimationTop;
            deleteAnimation = UITableViewRowAnimationBottom;
        }
        else {
            insertAnimation = UITableViewRowAnimationBottom;
            deleteAnimation = UITableViewRowAnimationTop;
        }
        // Apply the updates.
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:indexPathsToInsert withRowAnimation:insertAnimation];
        [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:deleteAnimation];
        [self.tableView endUpdates];
        self.openSectionIndex = sectionOpened;
        
        // Section opened will be going to the top position
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:NSNotFound inSection:sectionOpened];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}
-(void)sectionHeaderView:(WLSectionHeaderView*)sectionHeaderView sectionClosed:(NSInteger)sectionClosed {
 	WLSectionHeaderView *thissectionHeaderView = [_arrayOfSectionHeaders objectAtIndex:sectionClosed];
    thissectionHeaderView.expanded = NO;
    NSInteger countOfRowsToDelete = [self.tableView numberOfRowsInSection:sectionClosed];
    if (countOfRowsToDelete > 0) {
        NSMutableArray *indexPathsToDelete = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < countOfRowsToDelete; i++) {
            [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:i inSection:sectionClosed]];
        }
        [self.tableView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationTop];
    }
    self.openSectionIndex = NSNotFound;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.arrayOfSectionHeaders objectAtIndex:section];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    CGFloat headerHeight = 41.0;
    
    if (section == 0) {
        [self.tableView beginUpdates];
        headerHeight = 160.0;
        [self.tableView endUpdates];
    }
    return headerHeight;
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.arrayOfSectionHeaders count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	WLSectionHeaderView *sectionHeaderView = [_arrayOfSectionHeaders objectAtIndex:section];
	NSInteger numStoriesInSection = sectionHeaderView.numberOfRows;
    return sectionHeaderView.expanded ? numStoriesInSection : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIndentifier = @"photolistCell1";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    
    
    // Configure the cell...
    UILabel *label = (UILabel *)[cell viewWithTag:4];
    //    label.text = [NSString stringWithFormat:@"row %li",indexPath.row];
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        label.text = [NSString stringWithFormat:@"かゆみ"];
    } else if (indexPath.section == 1 && indexPath.row == 1) {
        label.text = [NSString stringWithFormat:@"いたみ"];
    } else if (indexPath.section == 1 && indexPath.row == 2) {
        label.text = [NSString stringWithFormat:@"円形脱毛"];
    } else if (indexPath.section == 2 && indexPath.row == 0) {
        label.text = [NSString stringWithFormat:@"目　黄色くな"];
    } else if (indexPath.section == 2 && indexPath.row == 1) {
        label.text = [NSString stringWithFormat:@"口　るかゆみ"];
    } else if (indexPath.section == 2 && indexPath.row == 2) {
        label.text = [NSString stringWithFormat:@"口　いたみ"];
    } else if (indexPath.section == 2 && indexPath.row == 3) {
        label.text = [NSString stringWithFormat:@"口　イボ"];
    } else if (indexPath.section == 3 && indexPath.row == 0) {
        label.text = [NSString stringWithFormat:@"のど　いたみ　はれ"];
    } else if (indexPath.section == 3 && indexPath.row == 1) {
        label.text = [NSString stringWithFormat:@"のど　タンがでる"];
    } else if (indexPath.section == 3 && indexPath.row == 2) {
        label.text = [NSString stringWithFormat:@"のど　せきがでる"];
    } else if (indexPath.section == 3 && indexPath.row == 3) {
        label.text = [NSString stringWithFormat:@"わき　かゆみ"];
    } else if (indexPath.section == 4 && indexPath.row == 0) {
        label.text = [NSString stringWithFormat:@"全体　いたみ"];
    } else if (indexPath.section == 4 && indexPath.row == 1) {
        label.text = [NSString stringWithFormat:@"下腹部　いたみ"];
    } else if (indexPath.section == 4 && indexPath.row == 2) {
        label.text = [NSString stringWithFormat:@"皮膚　かゆみ"];
    } else if (indexPath.section == 5 && indexPath.row == 0) {
        label.text = [NSString stringWithFormat:@"全体　かゆみ"];
    } else if (indexPath.section == 5 && indexPath.row == 1) {
        label.text = [NSString stringWithFormat:@"全体　イボ"];
    } else if (indexPath.section == 5 && indexPath.row == 2) {
        label.text = [NSString stringWithFormat:@"外陰部 かゆみ"];
    } else if (indexPath.section == 5 && indexPath.row == 3) {
        label.text = [NSString stringWithFormat:@"外陰部 いたみ"];
    } else if (indexPath.section == 5 && indexPath.row == 4) {
        label.text = [NSString stringWithFormat:@"外陰部 イボ"];
    } else if (indexPath.section == 5 && indexPath.row == 5) {
        label.text = [NSString stringWithFormat:@"外陰部 水泡　ただれ"];
    } else if (indexPath.section == 5 && indexPath.row == 6) {
        label.text = [NSString stringWithFormat:@"膣 かゆみ"];
    } else if (indexPath.section == 5 && indexPath.row == 7) {
        label.text = [NSString stringWithFormat:@"膣 いたみ"];
    } else if (indexPath.section == 5 && indexPath.row == 8) {
        label.text = [NSString stringWithFormat:@"膣 はれ"];
    } else if (indexPath.section == 5 && indexPath.row == 9) {
        label.text = [NSString stringWithFormat:@"膣 ただれ"];
    } else if (indexPath.section == 5 && indexPath.row == 10) {
        label.text = [NSString stringWithFormat:@"膣 イボ"];
    } else if (indexPath.section == 5 && indexPath.row == 11) {
        label.text = [NSString stringWithFormat:@"おりもの 多く出る"];
    } else if (indexPath.section == 5 && indexPath.row == 12) {
        label.text = [NSString stringWithFormat:@"おりもの ヨーグルト状"];
    } else if (indexPath.section == 5 && indexPath.row == 13) {
        label.text = [NSString stringWithFormat:@"おりもの 膿が混じる"];
    } else if (indexPath.section == 5 && indexPath.row == 14) {
        label.text = [NSString stringWithFormat:@"尿道 かゆみ"];
    } else if (indexPath.section == 5 && indexPath.row == 15) {
        label.text = [NSString stringWithFormat:@"尿道 いたみ"];
    } else if (indexPath.section == 5 && indexPath.row == 16) {
        label.text = [NSString stringWithFormat:@"尿道 炎症"];
    } else if (indexPath.section == 5 && indexPath.row == 17) {
        label.text = [NSString stringWithFormat:@"尿道 膿が出る"];
    } else if (indexPath.section == 5 && indexPath.row == 18) {
        label.text = [NSString stringWithFormat:@"尿道 クリームのうみ"];
    } else if (indexPath.section == 5 && indexPath.row == 19) {
        label.text = [NSString stringWithFormat:@"尿道 分泌物"];
    } else if (indexPath.section == 5 && indexPath.row == 20) {
        label.text = [NSString stringWithFormat:@"排尿時 いたみ"];
    } else if (indexPath.section == 5 && indexPath.row == 21) {
        label.text = [NSString stringWithFormat:@"性交時 不快感"];
    } else if (indexPath.section == 5 && indexPath.row == 22) {
        label.text = [NSString stringWithFormat:@"排尿時 不快感"];
    } else if (indexPath.section == 6 && indexPath.row == 0) {
        label.text = [NSString stringWithFormat:@"尿 頻尿"];
    } else if (indexPath.section == 6 && indexPath.row == 1) {
        label.text = [NSString stringWithFormat:@"尿 血尿"];
    } else if (indexPath.section == 6 && indexPath.row == 2) {
        label.text = [NSString stringWithFormat:@"尿 赤茶尿"];
    } else if (indexPath.section == 6 && indexPath.row == 3) {
        label.text = [NSString stringWithFormat:@"尿 でない"];
    } else if (indexPath.section == 6 && indexPath.row == 4) {
        label.text = [NSString stringWithFormat:@"尿 よわい"];
    } else if (indexPath.section == 6 && indexPath.row == 5) {
        label.text = [NSString stringWithFormat:@"便 ひどい下痢"];
    } else if (indexPath.section == 6 && indexPath.row == 6) {
        label.text = [NSString stringWithFormat:@"便 いちごゼリー状の血便"];
    } else if (indexPath.section == 6 && indexPath.row == 7) {
        label.text = [NSString stringWithFormat:@"便 便秘"];
    } else if (indexPath.section == 6 && indexPath.row == 8) {
        label.text = [NSString stringWithFormat:@"肛門 全体 かゆみ"];
    } else if (indexPath.section == 6 && indexPath.row == 9) {
        label.text = [NSString stringWithFormat:@"肛門 全体 いたみ"];
    } else if (indexPath.section == 6 && indexPath.row == 10) {
        label.text = [NSString stringWithFormat:@"肛門 全体 イボ"];
    } else if (indexPath.section == 6 && indexPath.row == 11) {
        label.text = [NSString stringWithFormat:@"肛門と睾丸の間 いたみ"];
    } else if (indexPath.section == 7 && indexPath.row == 0) {
        label.text = [NSString stringWithFormat:@"あし いたみ"];
    } else if (indexPath.section == 7 && indexPath.row == 1) {
        label.text = [NSString stringWithFormat:@"あし 違和感"];
    } else if (indexPath.section == 7 && indexPath.row == 2) {
        label.text = [NSString stringWithFormat:@"あし 無感覚"];
    } else if (indexPath.section == 7 && indexPath.row == 3) {
        label.text = [NSString stringWithFormat:@"ふともも かゆみ"];
    } else if (indexPath.section == 7 && indexPath.row == 4) {
        label.text = [NSString stringWithFormat:@"ふともも 水泡"];
    } else if (indexPath.section == 7 && indexPath.row == 5) {
        label.text = [NSString stringWithFormat:@"ふともも 違和感"];
    } else if (indexPath.section == 7 && indexPath.row == 6) {
        label.text = [NSString stringWithFormat:@"ふともも しびれ"];
    } else if (indexPath.section == 7 && indexPath.row == 7) {
        label.text = [NSString stringWithFormat:@"ふともも 腫れ"];
    } else if (indexPath.section == 0 && indexPath.row == 0) {
        label.text = [NSString stringWithFormat:@"XXXXXXXXXX"];
    }
    
    //    for (int tag = 1; tag <= 3; tag++) {
    //        UIImageView *image = (UIImageView *)[cell viewWithTag:tag];
    //        NSInteger assetNum = (3 * indexPath.row + (tag - 1) + (nowPage - 1) * 3 * rowNum );
    //        if (self.photos.count > assetNum) {
    //            ALAsset *asset = [self.photos objectAtIndex:assetNum];
    //            if (asset) {
    //                NSLog(@"at index = %li", (3 * indexPath.row + (tag - 1) + (nowPage - 1) * 3 * rowNum ));
    //
    //                ALAssetRepresentation *representation = [asset defaultRepresentation];
    //                NSURL *url = [representation url];
    //                NSLog(@"url: %@", [url absoluteString]);
    //                [image setImage:[UIImage imageWithCGImage:[asset thumbnail]]];
    //            } else {
    //                NSLog(@"not found");
    //                [image setImage:nil];
    //            }
    //        }
    //    }
    
    return cell;
}

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


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
     if ([[segue identifier] isEqualToString:@"showResultWoman"]) {
         ResultAViewController *vcntl = [segue destinationViewController];           // <- 1
         vcntl.manWoman = FALSE;                                                     // <- man
         vcntl.illInfoSection = [self.tableView indexPathForSelectedRow].section;    // <- 2
         vcntl.illInfoRow = [self.tableView indexPathForSelectedRow].row;            // <- 3
     }

 }


+ (ALAssetsLibrary *)defaultAssetsLibrary {
    static dispatch_once_t pred = 0;
    static ALAssetsLibrary *library = nil;
    dispatch_once(&pred, ^{
        library = [[ALAssetsLibrary alloc] init];
    });
    return library;
}

@end
