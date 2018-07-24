//
//  CYNBaseCollectionViewCell.h
//  Leclean
//
//  Created by Cyandnow on 2018/4/26.
//  Copyright © 2018年 Zhengzhou Yutong Bus Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CYNBaseTableDataModel;

@interface CYNBaseCollectionViewCell : UICollectionViewCell

// to override setter
@property(nonatomic, strong) __kindof CYNBaseTableDataModel *dataModel;

@end
