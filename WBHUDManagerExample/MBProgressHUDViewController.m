//
//  MBProgressHUDViewController.m
//  WBHUDManager
//
//  Created by 文波 on 2018/9/3.
//  Copyright © 2018年 文波. All rights reserved.
//

#import "MBProgressHUDViewController.h"
#import "MBProgressHUD+WBAddtional.h"

@interface MBProgressHUDViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation MBProgressHUDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"hide" style:UIBarButtonItemStylePlain
                                                                            target:self action:@selector(hide)];
}

- (void)hide {
    [MBProgressHUD wb_hideHUDForView:self.view];
}

// MARK:UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
                                 position:WBHUDPositionBottomStyle
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

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"加载菊花",
                        @"菊花带有文字",
                        @"成功提示",
                        @"失败提示",
                        @"信息提示",
                        @"警告提示",
                        @"文字提示",
                        @"文字+详情文字",
                        @"网络加载进度"];
    }
    return _titleArray;
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
