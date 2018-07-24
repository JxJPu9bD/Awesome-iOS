//
//  CYNBaseViewController.m
//  Leclean
//
//  Created by Cyandnow on 2018/4/9.
//  Copyright © 2018 Zhengzhou Yutong Bus Co.,Ltd. All rights reserved.
//

#import "CYNBaseViewController.h"
//#import "YTUtility.h"

@implementation CYNBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = self.frameForCustomFrame;
    self.view.autoresizesSubviews = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setupLeftBarItem];
}

- (void)setupLeftBarItem {

}

/**
 * 是否设置了自定义的Frame
 * @return bool
 */
- (BOOL)isCustomFrame {
    return (CGRectGetWidth(self.customFrame) != 0 || CGRectGetHeight(self.customFrame) != 0);
}

- (BOOL)isCustomBounds {
    return (CGRectGetWidth(self.customBounds) != 0 || CGRectGetHeight(self.customBounds) != 0);
}

//供子类View 调用的
- (CGRect)boundsForCustomBounds {
//    if (!self.isCustomBounds) { //填满父视图
//        return [YTUtility boundsForFrame:self.frameForCustomFrame];
//    }
    return self.customBounds;
}

//自身添加调用
- (CGRect)frameForCustomFrame {
//    if (!self.isCustomFrame) {
//        return [YTUtility boundsExcludeHeight:[YTUtility navigationBarHeight]];
//    }
    return self.customFrame;
}

//导航栏透明
- (void)navigationBarTransparency {
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
}

@end
