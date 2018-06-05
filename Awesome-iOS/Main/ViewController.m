//
//  ViewController.m
//  Awesome-iOS
//
//  Created by Cyandnow on 2018/4/19.
//  Copyright © 2018年 Cyandnow. All rights reserved.
//

#import "ViewController.h"
#import <React/RCTRootView.h>
#import <React/RCTBundleURLProvider.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTouchUpInside:(UIButton *)sender {
    
    // NSURL *JSCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
   NSURL *JSCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"
                                                                          fallbackResource:nil];
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
    UIViewController *viewController = UIViewController.new;
    viewController.view = rootView;
    [self presentViewController:viewController animated:YES completion:nil];
}



@end
