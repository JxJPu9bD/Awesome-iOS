//
//  CYNMessageDetailViewController.m
//  Awesome-iOS
//
//  Created by Cyandnow on 2018/7/5.
//  Copyright © 2018年 Cyandnow. All rights reserved.
//

#import "CYNMessageDetailViewController.h"

@interface CYNMessageDetailViewController ()

@end

@implementation CYNMessageDetailViewController

+ (void)load {
    [[HHRouter shared] map:@"CYNMessageDetailViewController"
         toControllerClass:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"detail: %@", @([[NSDate date] timeIntervalSince1970]).stringValue);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
