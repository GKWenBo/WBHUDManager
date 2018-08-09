//
//  SecondViewController.m
//  WBMBProgressHUDManager
//
//  Created by 文波 on 2018/7/19.
//  Copyright © 2018年 WMB. All rights reserved.
//

#import "SecondViewController.h"
#import "MBProgressHUD+WBAddtional.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.navigationController.navigationBar.hidden = YES;
    
    [MBProgressHUD wb_showActivityMessage:@"加载中..."
                                   toView:self.view];
    
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
