//
//  MBProgressHUD+WB.h
//  MBProgressHUD+WB1
//
//  Created by WMB on 2017/6/11.
//  Copyright © 2017年 文波. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

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

typedef NS_ENUM(NSInteger, WBHUDProgressStyle) {
    WBProgressHUDModeDeterminateStyle,              /*  < A round, pie-chart like, progress view. > */
    WBProgressHUDModeDeterminateHorizontalBarStyle, /*  < Horizontal progress bar > */
    WBProgressHUDModeAnnularDeterminateStyle        /*  < Ring-shaped progress view. > */
};

typedef void(^WBHUDConfigBlock)(MBProgressHUD *hud);
typedef void(^WBHUDCancelBlock)(MBProgressHUD *hud);

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
/** < 自定义蒙版颜色 > */
#define kWBHUDCustomMaskBackgroundColor [[UIColor blackColor] colorWithAlphaComponent:0.5f];

@interface MBProgressHUD (WBAddtional)

// MARK:Loading
/**
 只显示菊花，不会自动消失 (白字+黑底)

 @return MBProgressHUD实例对象
 */
+ (MBProgressHUD *)wb_showActivity;

/**
 只显示菊花，不会自动消失 (白字+黑底+自定义视图)

 @param view 要显示的视图
 @return MBProgressHUD实例对象
 */
+ (MBProgressHUD *)wb_showActivity:(UIView *)view;

/**
 菊花+文字 (白字+黑底)

 @param message 加载文字
 @return  MBProgressHUD实例对象
 */
+ (MBProgressHUD *)wb_showActivityMessage:(NSString *)message;

/**
 菊花+文字 (白字+黑底)

 @param message 加载文字
 @param view 要显示的视图
 @return MBProgressHUD实例对象
 */
+ (MBProgressHUD *)wb_showActivityMessage:(NSString *)message
                                   toView:(UIView *)view;

/**
 菊花+文字 （自定义文字+内容颜色+蒙版颜色+容器颜色）

 @param message 加载文字
 @param view 要显示的视图
 @param contentColor 内容颜色
 @param maskColor 蒙版颜色
 @param bezelColor 容器颜色
 @return MBProgressHUD实例对象
 */
+ (MBProgressHUD *)wb_showActivityMessage:(NSString *)message
                                   toView:(UIView *)view
                             contentColor:(UIColor *)contentColor
                                maskColor:(UIColor *)maskColor
                               bezelColor:(UIColor *)bezelColor;

/**
 菊花+文字 （自定义文字+文字颜色+蒙版颜色+容器颜色）

 @param message 加载文字
 @param view 要显示的视图
 @param titleColor 文字颜色
 @param maskColor 蒙版颜色
 @param bezelColor 容器颜色
 @return MBProgressHUD实例对象
 */
+ (MBProgressHUD *)wb_showActivityMessage:(NSString *)message
                                   toView:(UIView *)view
                               titleColor:(UIColor *)titleColor
                                maskColor:(UIColor *)maskColor
                               bezelColor:(UIColor *)bezelColor;

// MARK:Text
/**
 提示文字 （自定义文+位置中间 + 显示在window）

 @param message 文字
 */
+ (void)wb_showMessage:(NSString *)message;

/**
 提示文字 (标题 + 详情文字)

 @param message 文字
 @param detailMessage 详情文字
 */
+ (void)wb_showMessage:(NSString *)message
         detailMessage:(NSString *)detailMessage;

/**
 提示文字 (标题 + 详情文字 + 自定义位置 + 视图)

 @param message 文字
 @param detailMessage 详情文字
 @param position 位置
 */
+ (void)wb_showMessage:(NSString *)message
         detailMessage:(NSString *)detailMessage
                toView:(UIView *)view
              position:(WBHUDPositionStyle)position;

/**
 提示文字（自定义文+位置中间+显示在window+完成回调）

 @param message 文字
 @param completion 完成回调
 */
+ (void)wb_showMessage:(NSString *)message
            completion:(MBProgressHUDCompletionBlock)completion;

/**
 提示文字（自定文字+位置中间+自定义显示视图+完成回调）

 @param message 文字
 @param view 要显示的视图
 @param completion 完成回调
 */
+ (void)wb_showMessage:(NSString *)message
                toView:(UIView *)view
            completion:(MBProgressHUDCompletionBlock)completion;

/**
 提示文字 (自定义文字+自定义位置+自定义显示视图)

 @param message 文字
 @param view 要显示的视图
 @param position 位置
 @param completion 完成回调
 */
+ (void)wb_showMessage:(NSString *)message
                toView:(UIView *)view
              position:(WBHUDPositionStyle)position
            completion:(MBProgressHUDCompletionBlock)completion;

/**
 提示文字 (自定义文字+详情文字+自定义位置+内容样式)

 @param message 文字
 @param detailTitle 详情文字
 @param view 要显示的视图
 @param position 显示位置
 @param contentStyle 内容样式
 @param completion 完成回调
 */
+ (void)wb_showMessage:(NSString *)message
           detailTitle:(NSString *)detailTitle
                toView:(UIView *)view
              position:(WBHUDPositionStyle)position
          contentStyle:(WBHUDContentStyle)contentStyle
            completion:(MBProgressHUDCompletionBlock)completion;

// MARK:Image

/**
 自定义成功提示 (显示在window)

 @param success 提示文字
 */
+ (void)wb_showSuccess:(NSString *)success;

/**
 自定义成功提示 (显示在window + 完成回调)

 @param success 提示文字
 @param completion 完成回调
 */
+ (void)wb_showSuccess:(NSString *)success
            completion:(MBProgressHUDCompletionBlock)completion;

/**
 自定义成功提示 (显示在window + 完成回调 + 自定义显示视图)

 @param success 提示文字
 @param view 显示视图
 @param completion 完成回调
 */
+ (void)wb_showSuccess:(NSString *)success
                toView:(UIView *)view
            completion:(MBProgressHUDCompletionBlock)completion;

/**
 错误提示 (显示在window)

 @param error 提示文字
 */
+ (void)wb_showError:(NSString *)error;

/**
 错误提示 (显示在window + 完成回调)

 @param error 错误提示
 @param completion 完成回调
 */
+ (void)wb_showError:(NSString *)error
          completion:(MBProgressHUDCompletionBlock)completion;

/**
 错误提示 (显示在window + 完成回调 + 自定义显示视图)

 @param error 错误提示
 @param view 示视图
 @param completion 完成回调
 */
+ (void)wb_showError:(NSString *)error
              toView:(UIView *)view
          completion:(MBProgressHUDCompletionBlock)completion;

/**
 信息提示 (window)

 @param info 提示文字
 */
+ (void)wb_showInfo:(NSString *)info;

/**
 信息提示 (window + 完成回调)

 @param info 提示文字
 @param completion 完成回调
 */
+ (void)wb_showInfo:(NSString *)info
         completion:(MBProgressHUDCompletionBlock)completion;

/**
 信息提示 (window + 完成回调 + 自定义显示视图)

 @param info 提示文字
 @param view 自定义显示视图
 @param completion 完成回调
 */
+ (void)wb_showInfo:(NSString *)info
             toView:(UIView *)view
         completion:(MBProgressHUDCompletionBlock)completion;

/**
 警告提示 (window)

 @param warning 提示文字
 */
+ (void)wb_showWarning:(NSString *)warning;

/**
  警告提示 (window + 完成回调)

 @param warning 警告
 @param completion 完成回调
 */
+ (void)wb_showWarning:(NSString *)warning
            completion:(MBProgressHUDCompletionBlock)completion;

/**
 警告提示 (window + 完成回调 + 自定义视图)

 @param warning 警告
 @param view 自定义视图
 @param completion 完成回调
 */
+ (void)wb_showWarning:(NSString *)warning
                toView:(UIView *)view
            completion:(MBProgressHUDCompletionBlock)completion;

/**
 自定义图片 + 文字提示

 @param text 文字
 @param icon 图片名
 @param view 要显示的视图
 @param completion 完成回调
 */
+ (void)wb_show:(NSString *)text
           icon:(NSString *)icon
           view:(UIView *)view
     completion:(MBProgressHUDCompletionBlock)completion;

// MARK:Switch Model
/**
 Model切换

 @param view 要显示的视图
 @param title 要显示的文字
 @param configBlock 配置hud
 @return MBProgressHUD实例对象
 */
+ (MBProgressHUD *)wb_showModelSwitch:(UIView *)view
                                title:(NSString *)title
                          configBlock:(WBHUDConfigBlock)configBlock;

// MARK:Progress
/**
 文字 + 进度条

 @param view 要显示的视图
 @param progressStyle 进度样式
 @param title 提示文字
 @param configBlock 进度配置block
 @return MBProgressHUD实例对象
 */
+ (MBProgressHUD *)wb_showDownloadToView:(UIView *)view
                           progressStyle:(WBHUDProgressStyle)progressStyle
                                   title:(NSString *)title
                             configBlock:(WBHUDConfigBlock)configBlock;

/**
 文字 + 进度条 + 取消按钮

 @param view 要显示的视图
 @param progressStyle 进度样式
 @param title 提示文字
 @param cancelTitle 取消按钮标题
 @param configBlock 进度配置block
 @param cancelBlock 取消按钮点击回调
 @return MBProgressHUD实例对象
 */
+ (MBProgressHUD *)wb_showDownloadToView:(UIView *)view
                           progressStyle:(WBHUDProgressStyle)progressStyle
                                   title:(NSString *)title
                             cancelTitle:(NSString *)cancelTitle
                             configBlock:(WBHUDConfigBlock)configBlock
                             cancelBlock:(WBHUDCancelBlock)cancelBlock;

// MARK:Hide
+ (void)wb_hideHUD;
+ (void)wb_hideHUDForView:(UIView *)view;

@end
