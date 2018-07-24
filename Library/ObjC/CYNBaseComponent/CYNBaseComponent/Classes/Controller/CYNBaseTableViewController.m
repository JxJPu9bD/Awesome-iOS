//
//  CYNBaseTableViewController.m
//  JYBB
//
//  Created by blank on 2017/9/22.
//  Copyright © 2017年 JYW. All rights reserved.
//

#import "CYNBaseTableViewController.h"

/** Model */
#import "CYNBaseTableDataModel.h"

/** View */
#import "CYNBaseTableViewCell.h"
#import "CYNBaseRefreshHeader.h"
#import "CYNBaseRefreshFooter.h"
#import "CYNBaseTableView.h"
#import "YTAnimationHeader.h"
#import "YTAnimationFooter.h"


@interface CYNBaseTableViewController ()

        <
        UITableViewDataSource
        , UITableViewDelegate
        , YTBaseTableViewProtocol
        > {
    CYNBaseTableView *_tableView;
}

@end

@implementation CYNBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.pageIndex = 1;
    self.pageSize = 10;
}

///MARK: public

- (void)tableReloadData {
    [self.tableView reloadData];
}

/// TODO: 扩展

/**
 * 返回一个View
 * @param width View的宽度
 * @param height View的高度
 * @return tableHeaderFooterView
 */
- (UIView *)tableHeaderFooterViewWidth:(CGFloat)width height:(CGFloat)height {
    UIView *headerFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    headerFooterView.backgroundColor = [UIColor whiteColor];
    return headerFooterView;
}

- (void)setCustomRefreshHeader {
    self.tableView.mj_header = [YTAnimationHeader headerWithRefreshingTarget:self
                                                            refreshingAction:@selector(tableRefreshDataAction)];
}

- (void)tableRefreshDataAction {
    self.pageIndex = 1;
    if ([self respondsToSelector:@selector(requestTableViewRefreshData)]) {
        [self requestTableViewRefreshData];
    }

}

- (void)setCustomRefreshFooter {
    self.tableView.mj_footer = [YTAnimationFooter footerWithRefreshingTarget:self
                                                                refreshingAction:@selector(tableMoreDataAction)];
}

- (void)tableViewEndRefreshing {
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}


- (void)tableMoreDataAction {
    if (([self.dataSource[0] count] >= self.pageSize
            && [self.dataSource[0] count] % self.pageSize == 0)) {
        self.pageIndex = [self.dataSource[0] count] / self.pageSize + 1;
    } else {
        [self.tableView.mj_footer endRefreshing];
        return;
    }
    if ([self respondsToSelector:@selector(requestTableViewMoreData)]) {
        [self requestTableViewMoreData];
    }
}

- (void)resetRefreshState {
    if (self.pageIndex == 1) {
        if ([self.dataSource[0] count] < self.pageSize) {
            self.tableView.mj_footer.state = MJRefreshStateNoMoreData;
        } else {
            self.tableView.mj_footer.state = MJRefreshStateIdle;
        }
    } else {
        if (([self.dataSource[0] count] >= self.pageSize
              && [self.dataSource[0] count] % self.pageSize == 0)) {
            self.tableView.mj_footer.state = MJRefreshStateIdle;
        } else {
            self.tableView.mj_footer.state = MJRefreshStateNoMoreData;
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    CYNBaseTableDataModel *model;
    if (self.dataSource.count >= indexPath.section
            && [self.dataSource[(NSUInteger) indexPath.section] count] >= indexPath.row) {
        model = self.dataSource[(NSUInteger) indexPath.section][(NSUInteger) indexPath.row];

    }

    if ([self respondsToSelector:@selector(didSelectRowWithModel:)]) {
        [self didSelectRowWithModel:model];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self respondsToSelector:@selector(numberOfRowsInSection:)]) {
        return [self numberOfRowsInSection:section];
    }
    return [self.dataSource[(NSUInteger) section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CYNBaseTableDataModel *model = self.dataSource[(NSUInteger) indexPath.section][(NSUInteger) indexPath.row];
    CYNBaseTableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
    model.indexPath = indexPath;
    cell.dataModel = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self heightForRowAtIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if ([self respondsToSelector:@selector(heightForHeaderInSection:)]) {
        return [self heightForHeaderInSection:section];
    }
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if ([self respondsToSelector:@selector(heightForFooterInSection:)]) {
        return [self heightForFooterInSection:section];
    }
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if ([self respondsToSelector:@selector(viewForHeaderInSection:)]) {
        return [self viewForHeaderInSection:section];
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if ([self respondsToSelector:@selector(viewForFooterInSection:)]) {
        return [self viewForFooterInSection:section];
    }
    return nil;
}

/*
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self respondsToSelector:@selector(editingStyleForRowAtIndexPath:)]) {
        return [self editingStyleForRowAtIndexPath:indexPath];
    }
    return UITableViewCellEditingStyleNone;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self respondsToSelector:@selector(commitEditingStyle:forRowAtIndexPath:)]) {
        [self commitEditingStyle:editingStyle forRowAtIndexPath:indexPath];
    }
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self respondsToSelector:@selector(titleForDeleteConfirmationButtonForRowAtIndexPath:)]) {
        return [self titleForDeleteConfirmationButtonForRowAtIndexPath:indexPath];
    }
    return @"删除";
}
*/
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self respondsToSelector:@selector(editActionsForRowAtIndexPath:)]) {
        return [self editActionsForRowAtIndexPath:indexPath];
    }
    return @[];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDataSource:(NSArray *)dataSource {
    [self resetRefreshState];
    if (!dataSource || dataSource.count == 0) {
        _dataSource = nil;
        [self.tableView reloadData];
        return;
    }
    if ([dataSource[0] isKindOfClass:[NSArray class]]) { //符合要求的嵌套
        _dataSource = dataSource;
    } else { //嵌套一层
        _dataSource = @[dataSource];
    }
    [self.tableView reloadData];
}

- (void)setTableView:(UITableView *)tableView {
    _tableView = tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.boundsForCustomBounds
                                                  style:self.tableViewStyle];
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        _tableView.separatorStyle = self.separatorStyle;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

@end
