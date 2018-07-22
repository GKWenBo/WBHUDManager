//
//  TableViewController.m
//  WBMBProgressHUDManager
//
//  Created by WMB on 2018/2/2.
//  Copyright © 2018年 WMB. All rights reserved.
//

#import "TableViewController.h"
#import "MBProgressHUD+WBAddtional.h"
#import "SecondViewController.h"
@interface TableViewController ()

@end

@implementation TableViewController
- (IBAction)hideAction:(id)sender {
    NSLog(@"点击隐藏");
    [MBProgressHUD wb_hideHUDForView:self.view];
    
//    SecondViewController *vc =[SecondViewController new];
//    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationController.navigationBar.translucent = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            {
                [MBProgressHUD wb_showActivity:self.view];
            }
            break;
        case 1:
        {
            
            [MBProgressHUD wb_showActivityMessage:@"加载中..."
                                           toView:self.view];
        }
            break;
        case 2:
        {
//            [MBProgressHUD wb_showSuccess:@"登录成功" completion:nil];
        }
            break;
        case 3:
        {
//            [MBProgressHUD wb_showError:@"失败提示" completion:nil];
        }
            break;
        case 4:
        {
//            [MBProgressHUD wb_showInfo:@"信息提示" completion:nil];
//            [MBProgressHUD wb_showMessage:@"信息提示"];
            [MBProgressHUD wb_showMessage:@"信息提示"
                                   toView:self.view
                                 position:WBHUDPositionTopStyle
                               completion:^{
                                   NSLog(@"显示完成");
                               }];
            
        }
            break;
        case 5:
        {
//            [MBProgressHUD wb_showWarning:@"警告提示" completion:nil];
        }
            break;
        case 6:
        {
//            [MBProgressHUD wb_showMessage:@"文字提示" completion:nil];
        }
            break;
        default:
            break;
    }
}

#pragma mark - Table view data source
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"点击了");
}


@end
