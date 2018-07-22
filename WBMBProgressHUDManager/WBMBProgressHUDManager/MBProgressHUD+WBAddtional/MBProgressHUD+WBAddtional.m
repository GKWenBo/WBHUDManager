//
//  MBProgressHUD+WB.m
//  MBProgressHUD+WB1
//
//  Created by WMB on 2017/6/11.
//  Copyright © 2017年 文波. All rights reserved.
//

#import "MBProgressHUD+WBAddtional.h"
#import "MBProgressHUD+WBHUDExtension.h"

NSTimeInterval const kMinShowTime = 1.f;
NSTimeInterval const KHideAfterDelayTime = 1.2f;
NSTimeInterval const kActivityMinDismissTime = 0.5f;

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
                                         completion:nil];
    hud.mode = MBProgressHUDModeText;
    hud.detailTitle(detailTitle);
    hud.hudPositon(position);
    hud.hudContentStyle(contentStyle);
    hud.minShowTime = kMinShowTime;
    hud.completionBlock = completion;
}

//
//+ (MBProgressHUD *)wb_show:(NSString *)text
//                      icon:(NSString *)icon
//                      view:(UIView *)view
//     completion:(MBProgressHUDCompletionBlock)completion {
//
//    [self wb_hideHUD];
//
//    if (view == nil) view = [UIApplication sharedApplication].delegate.window;
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    hud.animationType = MBProgressHUDAnimationZoom;
//    hud.mode = MBProgressHUDModeCustomView;
//    hud.label.text = text;
//    UIImageView * imageView = [[UIImageView alloc]init];
//    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@",icon]];
//    hud.customView = imageView;
//    hud.removeFromSuperViewOnHide = YES;
//    hud.bezelView.color = [[UIColor blackColor] colorWithAlphaComponent:0.85f];
//    hud.contentColor = [UIColor whiteColor];
////    hud.backgroundView.color = [[UIColor blackColor] colorWithAlphaComponent:0.4f];
//    hud.minShowTime = kMinShowTime;
//    [hud hideAnimated:YES afterDelay:KHideAfterDelayTime];
//    hud.completionBlock = completion;
//    objc_setAssociatedObject(self, &kWBMBProgressHUDKey, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    return hud;
//}
//
//+ (MBProgressHUD *)wb_showSuccess:(NSString *)success
//                           toView:(UIView *)view
//                       completion:(MBProgressHUDCompletionBlock)completion{
//    return [self wb_show:success
//                    icon:@"success"
//                    view:view
//              completion:completion];
//}
//
//+ (MBProgressHUD *)wb_showError:(NSString *)error
//                         toView:(UIView *)view
//                     completion:(MBProgressHUDCompletionBlock)completion {
//    return [self wb_show:error
//                    icon:@"error"
//                    view:view
//              completion:completion];
//}
//
//+ (MBProgressHUD *)wb_showInfo:(NSString *)info
//                        toView:(UIView *)view
//                    completion:(MBProgressHUDCompletionBlock)completion {
//    return [self wb_show:info
//                    icon:@"MBHUD_Info"
//                    view:view
//              completion:completion];
//}
//
//+ (MBProgressHUD *)wb_showWarning:(NSString *)warning
//                           toView:(UIView *)view
//                       completion:(MBProgressHUDCompletionBlock)completion{
//    return [self wb_show:warning
//                    icon:@"MBHUD_Warn"
//                    view:view
//              completion:completion];
//}
//

//
//#pragma mark --------  Text && Image  --------
//#pragma mark
//+ (MBProgressHUD *)wb_showSuccess:(NSString *)success
//                       completion:(MBProgressHUDCompletionBlock)completion {
//    return [self wb_showSuccess:success
//                         toView:nil
//                     completion:completion];
//}
//
//+ (MBProgressHUD *)wb_showError:(NSString *)error
//                     completion:(MBProgressHUDCompletionBlock)completion{
//    return [self wb_showError:error
//                       toView:nil
//                   completion:completion];
//}
//
//+ (MBProgressHUD *)wb_showInfo:(NSString *)info
//                    completion:(MBProgressHUDCompletionBlock)completion{
//    return [self wb_showInfo:info
//                      toView:nil
//                  completion:completion];
//}
//
//+ (MBProgressHUD *)wb_showWarning:(NSString *)warning
//                       completion:(MBProgressHUDCompletionBlock)completion{
//    return [self wb_showWarning:warning
//                         toView:nil
//                     completion:completion];
//}
//
//+ (MBProgressHUD *)wb_showMessage:(NSString *)message
//                       completion:(MBProgressHUDCompletionBlock)completion{
//    return [self wb_showMessage:message
//                         toView:nil
//                     completion:completion];
//}
//

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

@end
