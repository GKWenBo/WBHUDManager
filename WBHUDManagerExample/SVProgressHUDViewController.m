//
//  SVProgressHUDViewController.m
//  WBHUDManager
//
//  Created by 文波 on 2018/9/3.
//  Copyright © 2018年 文波. All rights reserved.
//

#import "SVProgressHUDViewController.h"
#import "SVProgressHUD+WBAddtional.h"

@interface SVProgressHUDViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation SVProgressHUDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
            [SVProgressHUD wb_showSuccessWithStatus:@"登录成功！"
                                         completion:^{
                NSLog(@"完成回调");
            }];
        }
            break;
        case 1:
        {
            [SVProgressHUD wb_showErrorWithStatus:@"失败提示"
                                       completion:^{
                                           NSLog(@"完成回调");
                                       }];
        }
            break;
        case 2:
        {
            [SVProgressHUD wb_showTextWithStatus:@"信息提示"
                                      completion:^{
                                          NSLog(@"完成回调");
                                      }];
        }
            break;
        default:
            break;
    }
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"成功提示",
                        @"失败提示",
                        @"仅文字提示"];
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
