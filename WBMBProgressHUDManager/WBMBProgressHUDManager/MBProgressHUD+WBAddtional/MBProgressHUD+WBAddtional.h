//
//  MBProgressHUD+WB.h
//  MBProgressHUD+WB1
//
//  Created by WMB on 2017/6/11.
//  Copyright © 2017年 文波. All rights reserved.
//

#import "MBProgressHUD.h"

/**  < 最小显示时间 >  */
UIKIT_EXTERN NSTimeInterval const kMinShowTime;
/**  < 显示几秒后消失 >  */
UIKIT_EXTERN NSTimeInterval const KHideAfterDelayTime;
/**  < 菊花最少显示时间 >  */
UIKIT_EXTERN NSTimeInterval const kActivityMinDismissTime;

@interface MBProgressHUD (WBAddtional)

#pragma mark ------ < Mask Layer > ------
/** << 设置是否显示蒙层 > */
+ (void)wb_maskLayerEnabled:(BOOL)enabled;
/*  < 是否需要锁定屏幕 > */
+ (void)wb_lockScreen:(BOOL)lockScreen;

#pragma mark --------  Basic Method  --------
/**
 *  快速创建提示框 有菊花
 *
 *  @param message 提示信息
 *  @param view 显示视图
 *  @return hud
 */
+ (MBProgressHUD *)wb_showActivityMessage:(NSString *)message
                                   toView:(UIView *)view;
/**
 *  显示提示文字
 *
 *  @param message 提示信息
 *  @param view 显示的视图
 */
+ (MBProgressHUD *)wb_showMessage:(NSString *)message
                           toView:(UIView *)view
                       completion:(MBProgressHUDCompletionBlock)completion;
/**
 *  自定义成功提示
 *
 *  @param success 提示文字
 *  @param view 显示视图
 */
+ (MBProgressHUD *)wb_showSuccess:(NSString *)success
                           toView:(UIView *)view
                       completion:(MBProgressHUDCompletionBlock)completion;
/**
 *  自定义失败提示
 *
 *  @param error 提示文字
 *  @param view 显示视图
 */
+ (MBProgressHUD *)wb_showError:(NSString *)error
                         toView:(UIView *)view
                     completion:(MBProgressHUDCompletionBlock)completion;
/**
 *  自定义提示信息
 *
 *  @param info 提示信息
 *  @param view 示视图
 */
+ (MBProgressHUD *)wb_showInfo:(NSString *)info
                        toView:(UIView *)view
                    completion:(MBProgressHUDCompletionBlock)completion;

/**
 *  自定义警告提示
 *
 *  @param warning 提示信息
 *  @param view 示视图
 */
+ (MBProgressHUD *)wb_showWarning:(NSString *)warning
                           toView:(UIView *)view
                       completion:(MBProgressHUDCompletionBlock)completion;

/**
 *  自定义提示框
 *
 *  @param text 提示文字
 *  @param icon 图片名称
 *  @param view 展示视图
 */
+ (MBProgressHUD *)wb_show:(NSString *)text
                      icon:(NSString *)icon
                      view:(UIView *)view
                completion:(MBProgressHUDCompletionBlock)completion;

#pragma mark --------  Activity && Text  --------
/**  < 只显示菊花 >  */
+ (MBProgressHUD *)wb_showActivity;
/**  < 菊花带有文字 >  */
+ (MBProgressHUD *)wb_showActivityMessage:(NSString *)message;

#pragma mark --------  Text && Image  --------
/**
 文字提示

 @param message 提示文字
 @param completion 完成回调
 */
+ (MBProgressHUD *)wb_showMessage:(NSString *)message
                       completion:(MBProgressHUDCompletionBlock)completion;

/**
 成功提示

 @param success 提示文字
 @param completion 完成回调
 */
+ (MBProgressHUD *)wb_showSuccess:(NSString *)success
                       completion:(MBProgressHUDCompletionBlock)completion;

/**
 错误提示

 @param error 提示文字
 @param completion 完成回调
 */
+ (MBProgressHUD *)wb_showError:(NSString *)error
                     completion:(MBProgressHUDCompletionBlock)completion;

/**
 信息提示

 @param info 提示文字
 @param completion 完成回调
 */
+ (MBProgressHUD *)wb_showInfo:(NSString *)info
                    completion:(MBProgressHUDCompletionBlock)completion;

/**
 警告提示

 @param warning 提示文字
 @param completion 完成回调
 */
+ (MBProgressHUD *)wb_showWarning:(NSString *)warning
                       completion:(MBProgressHUDCompletionBlock)completion;

#pragma mark --------  Hide  --------
+ (void)wb_hideHUD;

@end
