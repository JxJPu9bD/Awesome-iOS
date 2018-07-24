//
//  CYNBaseTableDataModel.h
//  JYBB
//
//  Created by blank on 2017/9/22.
//  Copyright © 2017 JYW. All rights reserved.
//

#import "CYNBaseDataModel.h"

@interface CYNBaseTableDataModel : CYNBaseDataModel <NSCopying>

@property(nonatomic, strong) NSIndexPath *indexPath;

@property(nonatomic, getter=isSelected) BOOL selected;

- (id)copyWithZone:(nullable NSZone *)zone;
@end
