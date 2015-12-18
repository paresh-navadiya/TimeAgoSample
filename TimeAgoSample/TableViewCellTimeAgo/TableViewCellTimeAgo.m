//
//  TableViewCellTimeAgo.m
//  Share Document
//
//  Created by ECWIT on 18/12/15.
//  Copyright © 2015 pareshinfotech. All rights reserved.
//

#import "TableViewCellTimeAgo.h"
#import "NSDate+TimeAgo.h"

@implementation TableViewCellTimeAgo

- (void)awakeFromNib {
    // Initialization code
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark -
#pragma mark - Methods

-(void)startUpdatingTimeAgo
{
    if (self.curDate)
    {
        [self updateTimeAgo];
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimeAgo) userInfo:nil repeats:YES];
    }
}

-(void)updateTimeAgo
{
    NSString *strTimeAgo = [self.curDate timeAgo];
    //NSLog(@"\nstrTimeAgo is: %@", strTimeAgo);
    
    lblTimeAgo.text = strTimeAgo;
}

@end
