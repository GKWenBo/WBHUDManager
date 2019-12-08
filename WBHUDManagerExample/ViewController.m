//
//  ViewController.m
//  WBHUDManager
//
//  Created by 文波 on 2018/8/31.
//  Copyright © 2018年 文波. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUDViewController.h"
#import "MBProgressHUDViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"HUD DEMO";
}

// MARK:UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
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
            MBProgressHUDViewController *vc = [MBProgressHUDViewController new];
            [self.navigationController pushViewController:vc
                                                 animated:YES];
        }
            break;
        case 1:
        {
            SVProgressHUDViewController *vc = [SVProgressHUDViewController new];
            [self.navigationController pushViewController:vc
                                                 animated:YES];
        }
            break;
        default:
            break;
    }
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"MBProgressHUD",
                        @"SVProgressHUD"];
    }
    return _titleArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
