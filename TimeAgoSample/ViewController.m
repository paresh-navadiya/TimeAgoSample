//
//  ViewController.m
//  Share Document
//
//  Created by ECWIT on 04/11/15.
//  Copyright © 2015 pareshinfotech. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCellTimeAgo.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
{
    NSString *strPath;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Time update in cell sample";
    
    arrMutDates = [NSMutableArray array];
    
    NSInteger sampleTime = [[NSDate date] timeIntervalSince1970];
    [arrMutDates addObject:[NSString stringWithFormat:@"%d",sampleTime]];
    for (int i = 0; i<=100; i++)
    {
        NSInteger randomNumber = arc4random() % 32;
        
        NSInteger newTime = sampleTime-randomNumber;
        [arrMutDates addObject:[NSString stringWithFormat:@"%d",newTime]];
    }
    NSLog(@"arrMutDates : %@",arrMutDates);
//    [arrMutDates addObject:@"1449849537"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - UITableView DataSource And Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [arrMutDates count];
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strCellID = @"timeagocell";
    TableViewCellTimeAgo *cell = [tableView dequeueReusableCellWithIdentifier:strCellID];
    
    if (cell)
    {
        NSInteger timeStamp = [[arrMutDates objectAtIndex:indexPath.row] integerValue];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
        cell.curDate =date;
        
        [cell startUpdatingTimeAgo];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}


@end
