//
// Created by blank on 2017/10/19.
// Copyright (c) 2017 JYW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYNBaseDataModel.h"

@interface CYNBaseDataModel (CYNMapper)
+ (instancetype)yt_mapperObjectWithResult:(id)keyValues;

+ (NSMutableArray *)yt_mapperObjectArrayWithResult:(id)array;

- (NSDictionary *)yt_mapperDictionary;
@end