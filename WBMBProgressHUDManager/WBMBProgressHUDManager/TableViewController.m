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
            [MBProgressHUD wb_showSuccess:@"登录成功"
                                   toView:self.view
                               completion:nil];
        }
            break;
        case 3:
        {
            [MBProgressHUD wb_showError:@"失败提示"
                                 toView:self.view
                             completion:nil];
        }
            break;
        case 4:
        {
            [MBProgressHUD wb_showInfo:@"信息提示"
                                toView:self.view
                            completion:nil];
            
        }
            break;
        case 5:
        {
            [MBProgressHUD wb_showWarning:@"警告提示"
                                   toView:self.view
                               completion:nil];
        }
            break;
        case 6:
        {
            [MBProgressHUD wb_showMessage:@"信息提示"
                                   toView:self.view
                                 position:WBHUDPositionTopStyle
                               completion:^{
                                   NSLog(@"显示完成");
                               }];
        }
            break;
        case 7:
        {
            [MBProgressHUD wb_showMessage:@"标题"
                            detailMessage:@"详情"];
        }
            break;
        case 8:
        {
            __weak typeof(self) weakSelf = self;
            
            [MBProgressHUD wb_showModelSwitch:self.view
                                        title:@"准备下载..."
                                  configBlock:^(MBProgressHUD *hud) {
                                      dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                                          // Do something useful in the background and update the HUD periodically.
                                          [weakSelf doSomeWorkWithMixedProgress:hud];
                                          dispatch_async(dispatch_get_main_queue(), ^{
                                              [hud hideAnimated:YES];
                                          });
                                      });
                                  }];
        }
            break;
        default:
            break;
    }
}

- (void)doSomeWorkWithMixedProgress:(MBProgressHUD *)hud {
    // Indeterminate mode
    sleep(2);
    // Switch to determinate mode
    dispatch_async(dispatch_get_main_queue(), ^{
        hud.mode = MBProgressHUDModeDeterminate;
        hud.label.text = NSLocalizedString(@"Loading...", @"HUD loading title");
    });
    float progress = 0.0f;
    while (progress < 1.0f) {
        progress += 0.01f;
        dispatch_async(dispatch_get_main_queue(), ^{
            hud.progress = progress;
        });
        usleep(50000);
    }
    // Back to indeterminate mode
    dispatch_async(dispatch_get_main_queue(), ^{
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.label.text = NSLocalizedString(@"Cleaning up...", @"HUD cleanining up title");
    });
    sleep(2);
    dispatch_sync(dispatch_get_main_queue(), ^{
        UIImage *image = [[UIImage imageNamed:@"MBProgressHUD.bundle/success"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        hud.customView = imageView;
        hud.mode = MBProgressHUDModeCustomView;
        hud.label.text = NSLocalizedString(@"Completed", @"HUD completed title");
    });
    sleep(2);
}

#pragma mark - Table view data source
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"点击了");
}


@end
