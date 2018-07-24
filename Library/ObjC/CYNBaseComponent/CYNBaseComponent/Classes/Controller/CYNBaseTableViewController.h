//
//  CYNBaseTableViewController.h
//  JYBB
//
//  Created by blank on 2017/9/22.
//  Copyright © 2017年 JYW. All rights reserved.
//

#import "CYNBaseViewController.h"

@protocol YTBaseTableViewProtocol;
@class CYNBaseTableViewCell;
@class CYNBaseTableDataModel;
@class CYNBaseTableView;

@interface CYNBaseTableViewController : CYNBaseViewController

/**
 * 数据源
 */
@property(nonatomic, strong) NSArray * _Nullable dataSource;

@property(nonatomic, strong, nonnull) CYNBaseTableView *tableView;

@property(nonatomic, assign) UITableViewStyle tableViewStyle;

@property(nonatomic, assign) UITableViewCellSeparatorStyle separatorStyle;

@property(nonatomic, assign) NSUInteger pageIndex;

@property(nonatomic, assign) NSUInteger pageSize;

- (void)tableReloadData;

- (UIView * _Nonnull)tableHeaderFooterViewWidth:(CGFloat)width height:(CGFloat)height;

- (void)setCustomRefreshHeader;

- (void)setCustomRefreshFooter;

- (void)tableViewEndRefreshing;

@end

@protocol YTBaseTableViewProtocol <NSObject>


/// MARK: @abstract

@optional
- (CYNBaseTableViewCell *_Nullable)cellForRowAtIndexPath:(NSIndexPath *_Nullable)indexPath;

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *_Nullable)indexPath;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

- (CGFloat)heightForHeaderInSection:(NSInteger)section;

- (CGFloat)heightForFooterInSection:(NSInteger)section;

- (void)didSelectRowWithModel:(__kindof CYNBaseTableDataModel * _Nullable)model;

- (UIView* _Nullable)viewForHeaderInSection:(NSInteger)section;

- (UIView* _Nullable)viewForFooterInSection:(NSInteger)section;


/*
- (NSString*)titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath;

- (UITableViewCellEditingStyle)editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;
*/
- (nullable NSArray<UITableViewRowAction *> *)editActionsForRowAtIndexPath:(NSIndexPath *_Nullable)indexPath;

- (void)requestTableViewRefreshData;

- (void)requestTableViewMoreData;

@end
