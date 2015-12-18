//
//  TableViewCellTimeAgo.h
//  Share Document
//
//  Created by ECWIT on 18/12/15.
//  Copyright © 2015 pareshinfotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCellTimeAgo : UITableViewCell
{
    __weak IBOutlet UILabel *lblTimeAgo;

}
@property(nonatomic,strong)NSDate *curDate;

-(void)startUpdatingTimeAgo;
@end
