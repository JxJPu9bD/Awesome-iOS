//
//  CYNBaseTableViewCell.h
//  JYBB
//
//  Created by blank on 2017/9/22.
//  Copyright © 2017 JYW. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CYNBaseTableDataModel;

@interface CYNBaseTableViewCell : UITableViewCell

// to override setter
@property(nonatomic, strong) __kindof CYNBaseTableDataModel *dataModel;

@property(nonatomic, assign, getter=isMultiSelectionCell) BOOL multiSelectionCell;

+ (instancetype)cellWithFrame:(CGRect)frame owner:(id)owner;


@end
