//
//  CYNBaseTableDataModel.m
//  JYBB
//
//  Created by blank on 2017/9/22.
//  Copyright © 2017 JYW. All rights reserved.
//

#import "CYNBaseTableDataModel.h"

@implementation CYNBaseTableDataModel
- (id)copyWithZone:(nullable NSZone *)zone {
    CYNBaseTableDataModel *copy = [[self.class allocWithZone:zone] init];

    if (copy != nil) {
        copy.indexPath = self.indexPath;
        copy.selected = self.selected;
    }

    return copy;
}


@end
