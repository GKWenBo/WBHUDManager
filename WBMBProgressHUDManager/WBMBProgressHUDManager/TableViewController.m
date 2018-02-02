//
//  TableViewController.m
//  WBMBProgressHUDManager
//
//  Created by WMB on 2018/2/2.
//  Copyright © 2018年 WMB. All rights reserved.
//

#import "TableViewController.h"
#import "MBProgressHUD+WBAddtional.h"
@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            {
                [MBProgressHUD wb_maskLayerEnabled:NO];
                [MBProgressHUD wb_showActivity];
            }
            break;
        case 1:
        {
            [MBProgressHUD wb_maskLayerEnabled:YES];
            [MBProgressHUD wb_showActivityMessage:@"加载中..."];
        }
            break;
        case 2:
        {
            [MBProgressHUD wb_showSuccess:@"登录成功" completion:nil];
        }
            break;
        case 3:
        {
            [MBProgressHUD wb_showError:@"失败提示" completion:nil];
        }
            break;
        case 4:
        {
            [MBProgressHUD wb_showInfo:@"信息提示" completion:nil];
        }
            break;
        case 5:
        {
            [MBProgressHUD wb_showWarning:@"警告提示" completion:nil];
        }
            break;
        case 6:
        {
            [MBProgressHUD wb_showMessage:@"文字提示" completion:nil];
        }
            break;
        default:
            break;
    }
}

#pragma mark - Table view data source



@end
