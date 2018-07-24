//
// Created by blank on 2017/10/19.
// Copyright (c) 2017 JYW. All rights reserved.
//

#import "CYNBaseDataModel+CYNMapper.h"
#import <MJExtension/MJExtension.h>


@implementation CYNBaseDataModel (CYNMapper)

+ (instancetype)yt_mapperObjectWithResult:(id)keyValues {
    if (![keyValues isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    return [self mj_objectWithKeyValues:keyValues];
}

+ (NSMutableArray *)yt_mapperObjectArrayWithResult:(id)array {
    if (![array isKindOfClass:[NSArray class]]) {
        return nil;
    }
    return [self mj_objectArrayWithKeyValuesArray:array];
}

- (NSDictionary *)yt_mapperDictionary {
    return [[self mj_keyValues] copy];
}
@end