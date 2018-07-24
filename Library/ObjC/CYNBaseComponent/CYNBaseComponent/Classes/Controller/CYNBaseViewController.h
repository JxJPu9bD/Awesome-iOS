//
//  CYNBaseViewController.h
//  Leclean
//
//  Created by Cyandnow on 2018/4/9.
//  Copyright © 2018 Zhengzhou Yutong Bus Co.,Ltd. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <HHRouter/HHRouter.h>

@interface CYNBaseViewController : UIViewController

@property(nonatomic, assign) CGRect customFrame;

/**
 * 如果不自定义, 取 customFrame 的 bounds
 */
@property(nonatomic, assign) CGRect customBounds;

@property(nonatomic, assign, getter=isNeedDismiss) BOOL needDismiss;

/**
 * 标记有些页面不能直接调用pop
 */
@property(nonatomic, assign, getter=isPopToHome) BOOL popToHome;

/**
 * 是否设置了自定义的Frame
 * @return bool
 */
- (BOOL)isCustomFrame;

/**
 * 是否设置了自定义的Bounds
 * @return bool
 */
- (BOOL)isCustomBounds;

- (CGRect)boundsForCustomBounds;

/**
 * 使导航栏透明
 */
- (void)navigationBarTransparency;
@end
