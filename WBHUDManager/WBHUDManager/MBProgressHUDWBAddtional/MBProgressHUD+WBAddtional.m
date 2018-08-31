//
//  MBProgressHUD+WB.m
//  MBProgressHUD+WB1
//
//  Created by WMB on 2017/6/11.
//  Copyright © 2017年 文波. All rights reserved.
//

#import "MBProgressHUD+WBAddtional.h"
#import "MBProgressHUD+WBHUDExtension.h"
#import <objc/runtime.h>

NSTimeInterval const kMinShowTime = 1.f;
NSTimeInterval const KHideAfterDelayTime = 1.2f;
NSTimeInterval const kActivityMinDismissTime = 0.5f;

static char kWBHUDCancelKey;

@implementation MBProgressHUD (WBAddtional)

/** < 创建HUD > */
+ (MBProgressHUD *)wb_createHUD:(UIView *)view {
    if (view == nil) view = (UIView *)[UIApplication sharedApplication].delegate.window;
    return [MBProgressHUD showHUDAddedTo:view
                                animated:YES];
}

/** < 设置HUD > */
+ (MBProgressHUD *)wb_configHUDWithView:(UIView *)view
                                  title:(NSString *)title
                            autoDismiss:(BOOL)autoDismiss
                             completion:(MBProgressHUDCompletionBlock)completion {
    MBProgressHUD *hud = [self wb_createHUD:view];
    /** < 自动换行 > */
    hud.label.numberOfLines = 0;
    /** < 提示文字 > */
    hud.title(title);
    /** < 隐藏移除 > */
    hud.removeFromSuperViewOnHide = YES;
    /** <默认内容样式：黑底白字 > */
    hud.hudContentStyle(WBHUDContentBlackStyle);
    /** < 自动隐藏 > */
    if (autoDismiss) {
        [hud hideAnimated:YES
               afterDelay:KHideAfterDelayTime];
    }
    hud.completionBlock = completion;
    return hud;
}

+ (MBProgressHUD *)wb_showActivity {
    return [self wb_showActivityMessage:nil
                                 toView:nil];
}

+ (MBProgressHUD *)wb_showActivity:(UIView *)view {
    return [self wb_showActivityMessage:nil
                                 toView:view];
}

+ (MBProgressHUD *)wb_showActivityMessage:(NSString *)message {
    return [self wb_showActivityMessage:message
                                 toView:nil];
}

+ (MBProgressHUD *)wb_showActivityMessage:(NSString *)message
                                   toView:(UIView *)view {
    MBProgressHUD *hud = [self wb_configHUDWithView:view
                                              title:message
                                        autoDismiss:NO
                                         completion:nil];
    hud.mode = MBProgressHUDModeIndeterminate;
    /** < 加载提示最小显示时间 > */
    hud.minShowTime = kActivityMinDismissTime;
    return hud;
}

+ (MBProgressHUD *)wb_showActivityMessage:(NSString *)message
                                   toView:(UIView *)view
                             contentColor:(UIColor *)contentColor
                                maskColor:(UIColor *)maskColor
                               bezelColor:(UIColor *)bezelColor {
    MBProgressHUD *hud = [self wb_configHUDWithView:view
                                              title:message
                                        autoDismiss:NO
                                         completion:nil];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.hudContentColor(contentColor);
    hud.hudMaskColor(maskColor);
    hud.hudBezelColor(bezelColor);
    /** < 加载提示最小显示时间 > */
    hud.minShowTime = kActivityMinDismissTime;
    return hud;
}

+ (MBProgressHUD *)wb_showActivityMessage:(NSString *)message
                                   toView:(UIView *)view
                               titleColor:(UIColor *)titleColor
                                maskColor:(UIColor *)maskColor
                               bezelColor:(UIColor *)bezelColor {
    MBProgressHUD *hud = [self wb_configHUDWithView:view
                                              title:message
                                        autoDismiss:NO
                                         completion:nil];
    hud.titleColor(titleColor);
    hud.hudMaskColor(maskColor);
    hud.hudBezelColor(bezelColor);
    /** < 加载提示最小显示时间 > */
    hud.minShowTime = kActivityMinDismissTime;
    return hud;
}

// MARK:Text
+ (void)wb_showMessage:(NSString *)message {
    [self wb_showMessage:message
                  toView:nil
              completion:nil];
}

+ (void)wb_showMessage:(NSString *)message
         detailMessage:(NSString *)detailMessage {
    [self wb_showMessage:message
             detailTitle:detailMessage
                  toView:nil
                position:WBHUDPositionCenterStyle
            contentStyle:WBHUDContentBlackStyle
              completion:nil];
}

+ (void)wb_showMessage:(NSString *)message
         detailMessage:(NSString *)detailMessage
                toView:(UIView *)view
              position:(WBHUDPositionStyle)position {
    [self wb_showMessage:message
             detailTitle:detailMessage
                  toView:view
                position:position
            contentStyle:WBHUDContentBlackStyle
              completion:nil];
}

+ (void)wb_showMessage:(NSString *)message
            completion:(MBProgressHUDCompletionBlock)completion {
    [self wb_showMessage:message
                  toView:nil
              completion:completion];
}

+ (void)wb_showMessage:(NSString *)message
                toView:(UIView *)view
            completion:(MBProgressHUDCompletionBlock)completion {
    [self wb_showMessage:message
             detailTitle:nil
                  toView:view
                position:WBHUDPositionCenterStyle
            contentStyle:WBHUDContentBlackStyle
              completion:completion];
}

+ (void)wb_showMessage:(NSString *)message
                toView:(UIView *)view
              position:(WBHUDPositionStyle)position
            completion:(MBProgressHUDCompletionBlock)completion {
    [self wb_showMessage:message
             detailTitle:nil
                  toView:view
                position:position
            contentStyle:WBHUDContentBlackStyle
              completion:completion];
}

+ (void)wb_showMessage:(NSString *)message
           detailTitle:(NSString *)detailTitle
                toView:(UIView *)view
              position:(WBHUDPositionStyle)position
          contentStyle:(WBHUDContentStyle)contentStyle
            completion:(MBProgressHUDCompletionBlock)completion {
    MBProgressHUD *hud = [self wb_configHUDWithView:view
                                              title:message
                                        autoDismiss:YES
                                         completion:completion];
    hud.mode = MBProgressHUDModeText;
    hud.detailTitle(detailTitle);
    hud.hudPositon(position);
    hud.hudContentStyle(contentStyle);
    hud.minShowTime = kMinShowTime;
}

// MARK:Image
+ (void)wb_showSuccess:(NSString *)success {
    [self wb_showSuccess:success
                  toView:nil
              completion:nil];
}
+ (void)wb_showSuccess:(NSString *)success
            completion:(MBProgressHUDCompletionBlock)completion {
    [self wb_showSuccess:success
                  toView:nil
              completion:completion];
}
+ (void)wb_showSuccess:(NSString *)success
                toView:(UIView *)view
            completion:(MBProgressHUDCompletionBlock)completion {
    [self wb_show:success
             icon:@"MBProgressHUD.bundle/success"
             view:view
       completion:completion];
}

+ (void)wb_showError:(NSString *)error {
    [self wb_showError:error
                toView:nil
            completion:nil];
}

+ (void)wb_showError:(NSString *)error
          completion:(MBProgressHUDCompletionBlock)completion {
    [self wb_showError:error
                toView:nil
            completion:completion];
}

+ (void)wb_showError:(NSString *)error
              toView:(UIView *)view
          completion:(MBProgressHUDCompletionBlock)completion {
    [self wb_show:error
             icon:@"MBProgressHUD.bundle/error"
             view:view
       completion:completion];
}

+ (void)wb_showInfo:(NSString *)info {
    [self wb_showInfo:info
               toView:nil
           completion:nil];
}

+ (void)wb_showInfo:(NSString *)info
         completion:(MBProgressHUDCompletionBlock)completion {
    [self wb_showInfo:info
               toView:nil
           completion:completion];
}

+ (void)wb_showInfo:(NSString *)info
             toView:(UIView *)view
         completion:(MBProgressHUDCompletionBlock)completion {
    [self wb_show:info
             icon:@"MBProgressHUD.bundle/MBHUD_Info"
             view:view
       completion:completion];
}

+ (void)wb_showWarning:(NSString *)warning {
    [self wb_showWarning:warning
                  toView:nil
              completion:nil];
}

+ (void)wb_showWarning:(NSString *)warning
            completion:(MBProgressHUDCompletionBlock)completion {
    [self wb_showWarning:warning
                  toView:nil
              completion:completion];
}

+ (void)wb_showWarning:(NSString *)warning
                toView:(UIView *)view
            completion:(MBProgressHUDCompletionBlock)completion {
    [self wb_show:warning
             icon:@"MBProgressHUD.bundle/MBHUD_Warn"
             view:view
       completion:completion];
}

+ (void)wb_show:(NSString *)text
           icon:(NSString *)icon
           view:(UIView *)view
     completion:(MBProgressHUDCompletionBlock)completion {
    MBProgressHUD *hud = [self wb_configHUDWithView:view
                                              title:text
                                        autoDismiss:YES
                                         completion:completion];
    hud.mode = MBProgressHUDModeCustomView;
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.iconName(icon);
}

// MARK:Switch Model
+ (MBProgressHUD *)wb_showModelSwitch:(UIView *)view
                                title:(NSString *)title
                          configBlock:(WBHUDConfigBlock)configBlock {
    MBProgressHUD *hud = [self wb_configHUDWithView:view
                                              title:title
                                        autoDismiss:NO
                                         completion:nil];
    hud.minSize = CGSizeMake(150.f, 100.f);
    if (configBlock) {
        configBlock(hud);
    }
    return hud;
}

// MARK:Progress
+ (MBProgressHUD *)wb_showDownloadToView:(UIView *)view
                           progressStyle:(WBHUDProgressStyle)progressStyle
                                   title:(NSString *)title
                             configBlock:(WBHUDConfigBlock)configBlock;
 {
    MBProgressHUD *hud = [self wb_configHUDWithView:view
                                              title:title
                                        autoDismiss:NO
                                         completion:nil];
    if (progressStyle == WBProgressHUDModeDeterminateStyle) {
        hud.mode = MBProgressHUDModeDeterminate;
    }
    if (progressStyle == WBProgressHUDModeAnnularDeterminateStyle) {
        hud.mode = MBProgressHUDModeAnnularDeterminate;
    }
    if (progressStyle == WBProgressHUDModeDeterminateHorizontalBarStyle) {
        hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    }
    if (configBlock) {
        configBlock(hud);
    }
     return hud;
}

+ (MBProgressHUD *)wb_showDownloadToView:(UIView *)view
                           progressStyle:(WBHUDProgressStyle)progressStyle
                                   title:(NSString *)title
                             cancelTitle:(NSString *)cancelTitle
                             configBlock:(WBHUDConfigBlock)configBlock
                             cancelBlock:(WBHUDCancelBlock)cancelBlock {
    MBProgressHUD *hud = [self wb_configHUDWithView:view
                                              title:title
                                        autoDismiss:NO
                                         completion:nil];
    if (progressStyle == WBProgressHUDModeDeterminateStyle) {
        hud.mode = MBProgressHUDModeDeterminate;
    }
    if (progressStyle == WBProgressHUDModeAnnularDeterminateStyle) {
        hud.mode = MBProgressHUDModeAnnularDeterminate;
    }
    if (progressStyle == WBProgressHUDModeDeterminateHorizontalBarStyle) {
        hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    }
    [hud.button setTitle:cancelTitle ? : NSLocalizedString(@"Cancel", @"HUD cancel button title")
                forState:UIControlStateNormal];
    [hud.button addTarget:self
                   action:@selector(didClickedCancelBtn)
         forControlEvents:UIControlEventTouchUpInside];
    hud.cancelBlock = cancelBlock;
    
    if (configBlock) {
        configBlock(hud);
    }
    return hud;
}

//#pragma mark --------  Private Method  --------
//#pragma mark
////获取当前屏幕显示的viewcontroller
//+ (UIViewController *)wb_getCurrentWindowVc
//{
//    UIViewController *result = nil;
//    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
//    if (window.windowLevel != UIWindowLevelNormal)
//    {
//        NSArray *windows = [[UIApplication sharedApplication] windows];
//        for(UIWindow * tempWindow in windows)
//        {
//            if (tempWindow.windowLevel == UIWindowLevelNormal)
//            {
//                window = tempWindow;
//                break;
//            }
//        }
//    }
//    UIView *frontView = [[window subviews] objectAtIndex:0];
//    id nextResponder = [frontView nextResponder];
//    if ([nextResponder isKindOfClass:[UIViewController class]])
//    {
//        result = nextResponder;
//    }
//    else
//    {
//        result = window.rootViewController;
//    }
//    return  result;
//}
//
//+ (UIViewController *)wb_getCurrentVc
//{
//    UIViewController  *superVC = [[self class]  wb_getCurrentWindowVc ];
//    if ([superVC isKindOfClass:[UITabBarController class]]) {
//        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
//        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
//            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
//        }
//        return tabSelectVC;
//    }else
//        if ([superVC isKindOfClass:[UINavigationController class]]) {
//            return ((UINavigationController*)superVC).viewControllers.lastObject;
//        }
//    return superVC;
//}

// MARK:Hide
+ (void)wb_hideHUD {
    [self wb_hideHUDForView:nil];
}

+ (void)wb_hideHUDForView:(UIView *)view {
    if (view == nil) view = (UIView *)[UIApplication sharedApplication].delegate.window;
    [self hideHUDForView:view animated:YES];
}

// MARK:设置样式
- (MBProgressHUD *(^)(WBHUDContentStyle))hudContentStyle {
    return ^(WBHUDContentStyle hudContentStyle) {
        switch (hudContentStyle) {
            case WBHUDContentBlackStyle:
                self.contentColor = [UIColor whiteColor];
                self.bezelView.backgroundColor = [UIColor blackColor];
                self.bezelView.style = MBProgressHUDBackgroundStyleBlur;
                break;
            case WBHUDContentCustomStyle:
                self.contentColor = kWBHUDCustomContentColor;
                self.bezelView.backgroundColor = kWBHUDCustomBezelColor;
                self.bezelView.style = MBProgressHUDBackgroundStyleBlur;
                break;
            default:
                self.contentColor = [UIColor blackColor];
                self.bezelView.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
                self.bezelView.style = MBProgressHUDBackgroundStyleBlur;
                break;
        }
        return self;
    };
}

- (MBProgressHUD *(^)(UIColor *))hudMaskColor {
    return ^(UIColor *hudMaskColor) {
        self.backgroundView.backgroundColor = hudMaskColor;
        return self;
    };
}

- (MBProgressHUD *(^)(UIColor *))hudContentColor {
    return ^(UIColor *hudContentColor) {
        self.contentColor = hudContentColor;
        return self;
    };
}

- (MBProgressHUD *(^)(UIColor *))hudBezelColor {
    return ^(UIColor *hudBezelColor) {
        self.bezelView.backgroundColor = hudBezelColor;
        return self;
    };
}

- (MBProgressHUD *(^)(NSString *))title {
    return ^(NSString *title) {
        self.label.text = title;
        return self;
    };
}

- (MBProgressHUD *(^)(NSString *))detailTitle {
    return ^(NSString *detailTitle) {
        self.detailsLabel.text = detailTitle;
        return self;
    };
}

- (MBProgressHUD *(^)(UIColor *))titleColor {
    return ^(UIColor *titleColor) {
        self.label.textColor = titleColor;
        return self;
    };
}

- (MBProgressHUD *(^)(WBHUDPositionStyle))hudPositon {
    return ^(WBHUDPositionStyle hudPositon) {
        switch (hudPositon) {
            case WBHUDPositionTopStyle:
                self.offset = CGPointMake(0, -MBProgressMaxOffset);
                break;
            case WBHUDPositionCenterStyle:
                self.offset = CGPointZero;
                break;
            case WBHUDPositionBottomStyle:
                self.offset = CGPointMake(0, MBProgressMaxOffset);
                break;
            default:
                break;
        }
        return self;
    };
}

- (MBProgressHUD *(^)(NSString *))iconName {
    return ^(NSString *iconName) {
        self.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:iconName]];
        return self;
    };
}

- (void)setCancelBlock:(WBHUDCancelBlock)cancelBlock {
    objc_setAssociatedObject(self, &kWBHUDCancelKey, cancelBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (WBHUDCancelBlock)cancelBlock {
    return objc_getAssociatedObject(self, &kWBHUDCancelKey);
}

// MARK:Event Response
- (void)didClickedCancelBtn {
    if (self.cancelBlock) {
        self.cancelBlock(self);
    }
}

@end
