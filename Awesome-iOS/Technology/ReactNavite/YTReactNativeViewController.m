//
//  YTReactNativeViewController.m
//  Awesome-iOS
//
//  Created by Cyandnow on 2018/4/19.
//  Copyright © 2018年 Cyandnow. All rights reserved.
//

#import "YTReactNativeViewController.h"

#import <React/RCTRootView.h>
#import <React/RCTBundleURLProvider.h>

@interface YTReactNativeViewController ()

@end

@implementation YTReactNativeViewController

- (void)loadView {
    NSURL *JSCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"
                                                                           fallbackResource:nil];
//    NSURL *JSCodeLocation = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"jsbundle"];
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:JSCodeLocation
                                                        moduleName:@"RNHighScores"
                                                 initialProperties:@{
                                                                     @"scores": @[
                                                                             @{
                                                                                 @"name": @"Alex",
                                                                                 @"value": @"11"
                                                                                 },
                                                                             @{
                                                                                 @"name": @"Joel",
                                                                                 @"value": @"10"
                                                                                 }
                                                                             ]
                                                                     }
                                                     launchOptions:nil];
    self.view = rootView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
