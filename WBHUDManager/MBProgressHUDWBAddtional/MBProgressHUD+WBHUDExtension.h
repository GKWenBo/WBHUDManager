//
//  MBProgressHUD+WBHUDExtension.h
//  WBMBProgressHUDManager
//
//  Created by 文波 on 2018/7/22.
//  Copyright © 2018年 WMB. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD ()

// MARK:Property
/** < 内容文字颜色 默认：WBHUDContentBlackStyle > */
@property (nonatomic, assign, readonly) MBProgressHUD *(^hudContentStyle)(WBHUDContentStyle hudContentStyle);
/** < 蒙版颜色 > */
@property (nonatomic, strong, readonly) MBProgressHUD *(^hudMaskColor)(UIColor *hudMaskColor);
/** < 内容颜色 > */
@property (nonatomic, strong, readonly) MBProgressHUD *(^hudContentColor)(UIColor *hudContentColor);
/** < 容器颜色 > */
@property (nonatomic, strong, readonly) MBProgressHUD *(^hudBezelColor)(UIColor *hudBezelColor);
/** < 标题 > */
@property (nonatomic, copy, readonly) MBProgressHUD *(^title)(NSString *title);
/** < 详情标题 > */
@property (nonatomic, copy, readonly) MBProgressHUD *(^detailTitle)(NSString *detailTitle);
/** < 标题颜色 > */
@property (nonatomic, strong, readonly) MBProgressHUD *(^titleColor)(UIColor *titleColor);
/** < 文字显示位置 默认：WBHUDPositionCenterStyle > */
@property (nonatomic, assign, readonly) MBProgressHUD *(^hudPositon)(WBHUDPositionStyle hudPositon);
/*  < 自定义图片名 > */
@property (nonatomic, copy, readonly) MBProgressHUD *(^iconName)(NSString *iconName);
/*  < 取消按钮回调 > */
@property (nonatomic, copy, readonly) WBHUDCancelBlock cancelBlock;

@end
