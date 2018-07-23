//
//  CYNHomeViewController.m
//  Awesome-iOS
//
//  Created by Cyandnow on 2018/7/5.
//  Copyright © 2018年 Cyandnow. All rights reserved.
//

#import "CYNHomeViewController.h"

@interface CYNHomeViewController ()
        <
        UITableViewDataSource
        , UITableViewDelegate
        >

@property(nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation CYNHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"home: %@", @([[NSDate date] timeIntervalSince1970]).stringValue);
}

/// MARK: - tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:@"CYNHomeTableViewCell"
                                           forIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = [[HHRouter shared] matchController:@"CYNMessageDetailViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
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
