//
//  MBProgressHUD+WB.h
//  MBProgressHUD+WB1
//
//  Created by WMB on 2017/6/11.
//  Copyright © 2017年 文波. All rights reserved.
//

#import "MBProgressHUD.h"

typedef NS_ENUM(NSInteger, WBHUDPositionStyle) {
    WBHUDPositionTopStyle,      /** < 文字顶部 > */
    WBHUDPositionCenterStyle,   /** < 文字中间 > */
    WBHUDPositionBottomStyle    /** < 文字底部 > */
};

typedef NS_ENUM(NSInteger, WBHUDContentStyle) {
    WBHUDContentDefaultStyle,   /** < 默认白底黑字 > */
    WBHUDContentBlackStyle,     /** < 黑底白字 > */
    WBHUDContentCustomStyle     /** < 自定义样式 > */
};

/**  < 最小显示时间 >  */
UIKIT_EXTERN NSTimeInterval const kMinShowTime;
/**  < 显示几秒后消失 >  */
UIKIT_EXTERN NSTimeInterval const KHideAfterDelayTime;
/**  < 菊花最少显示时间 >  */
UIKIT_EXTERN NSTimeInterval const kActivityMinDismissTime;

/** < 文字内容颜色 > */
#define kWBHUDCustomContentColor [UIColor colorWithWhite:1.f alpha:0.7f]
/** < 方框颜色 > */
#define kWBHUDCustomBezelColor [UIColor colorWithWhite:1.f alpha:0.7f]
/** < 蒙版颜色 > */
#define kWBHUDMaskBackgroundColor [[UIColor blackColor] colorWithAlphaComponent:0.5];

@interface MBProgressHUD (WBAddtional)

// MARK:Property
/** < 内容文字颜色 > */
@property (nonatomic, assign, readonly) MBProgressHUD *(^hudContentStyle)(WBHUDContentStyle hudContentStyle);
/** < 蒙版颜色 > */
@property (nonatomic, strong, readonly) MBProgressHUD *(^hudMaskColor)(UIColor *hudMaskColor);
/** < 内容颜色 > */
@property (nonatomic, strong, readonly) MBProgressHUD *(^hudContentColor)(UIColor *hudContentColor);
/** < 容器颜色 > */
@property (nonatomic, strong, readonly) MBProgressHUD *(^hudBezelColor)(UIColor *hudBezelColor);

///**
// *  显示提示文字
// *
// *  @param message 提示信息
// *  @param view 显示的视图
// */
//+ (MBProgressHUD *)wb_showMessage:(NSString *)message
//                           toView:(UIView *)view
//                       completion:(MBProgressHUDCompletionBlock)completion;
///**
// *  自定义成功提示
// *
// *  @param success 提示文字
// *  @param view 显示视图
// */
//+ (MBProgressHUD *)wb_showSuccess:(NSString *)success
//                           toView:(UIView *)view
//                       completion:(MBProgressHUDCompletionBlock)completion;
///**
// *  自定义失败提示
// *
// *  @param error 提示文字
// *  @param view 显示视图
// */
//+ (MBProgressHUD *)wb_showError:(NSString *)error
//                         toView:(UIView *)view
//                     completion:(MBProgressHUDCompletionBlock)completion;
///**
// *  自定义提示信息
// *
// *  @param info 提示信息
// *  @param view 示视图
// */
//+ (MBProgressHUD *)wb_showInfo:(NSString *)info
//                        toView:(UIView *)view
//                    completion:(MBProgressHUDCompletionBlock)completion;
//
///**
// *  自定义警告提示
// *
// *  @param warning 提示信息
// *  @param view 示视图
// */
//+ (MBProgressHUD *)wb_showWarning:(NSString *)warning
//                           toView:(UIView *)view
//                       completion:(MBProgressHUDCompletionBlock)completion;
//
///**
// *  自定义提示框
// *
// *  @param text 提示文字
// *  @param icon 图片名称
// *  @param view 展示视图
// */
//+ (MBProgressHUD *)wb_show:(NSString *)text
//                      icon:(NSString *)icon
//                      view:(UIView *)view
//                completion:(MBProgressHUDCompletionBlock)completion;
//

// MARK:Loading
/**
 只显示菊花，不会自动消失

 @return MBProgressHUD实例对象
 */
+ (MBProgressHUD *)wb_showActivity;

/**
 菊花+文字

 @param message 加载文字
 @return  MBProgressHUD实例对象
 */
+ (MBProgressHUD *)wb_showActivityMessage:(NSString *)message;

/**
 菊花+文字

 @param message 加载文字
 @param view 要显示的视图
 @return MBProgressHUD实例对象
 */
+ (MBProgressHUD *)wb_showActivityMessage:(NSString *)message
                                   toView:(UIView *)view;

/**
 菊花+文字

 @param message 加载文字
 @param view 要显示的视图
 @param contentColor 加载文字颜色
 @param maskColor 蒙版颜色
 @param bezelColor 容器颜色
 @return MBProgressHUD实例对象
 */
+ (MBProgressHUD *)wb_showActivityMessage:(NSString *)message
                                   toView:(UIView *)view
                             contentColor:(UIColor *)contentColor
                                maskColor:(UIColor *)maskColor
                               bezelColor:(UIColor *)bezelColor;

// MARK:Text

//#pragma mark --------  Text && Image  --------
///**
// 文字提示
//
// @param message 提示文字
// @param completion 完成回调
// */
//+ (MBProgressHUD *)wb_showMessage:(NSString *)message
//                       completion:(MBProgressHUDCompletionBlock)completion;
//
///**
// 成功提示
//
// @param success 提示文字
// @param completion 完成回调
// */
//+ (MBProgressHUD *)wb_showSuccess:(NSString *)success
//                       completion:(MBProgressHUDCompletionBlock)completion;
//
///**
// 错误提示
//
// @param error 提示文字
// @param completion 完成回调
// */
//+ (MBProgressHUD *)wb_showError:(NSString *)error
//                     completion:(MBProgressHUDCompletionBlock)completion;
//
///**
// 信息提示
//
// @param info 提示文字
// @param completion 完成回调
// */
//+ (MBProgressHUD *)wb_showInfo:(NSString *)info
//                    completion:(MBProgressHUDCompletionBlock)completion;
//
///**
// 警告提示
//
// @param warning 提示文字
// @param completion 完成回调
// */
//+ (MBProgressHUD *)wb_showWarning:(NSString *)warning
//                       completion:(MBProgressHUDCompletionBlock)completion;
//

// MARK:Hide
+ (void)wb_hideHUD;
+ (void)wb_hideHUDForView:(UIView *)view;

@end
