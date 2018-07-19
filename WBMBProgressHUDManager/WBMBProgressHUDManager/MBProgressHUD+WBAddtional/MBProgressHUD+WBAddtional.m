//
//  MBProgressHUD+WB.m
//  MBProgressHUD+WB1
//
//  Created by WMB on 2017/6/11.
//  Copyright © 2017年 文波. All rights reserved.
//

#import "MBProgressHUD+WBAddtional.h"
#import <objc/runtime.h>

NSTimeInterval const kMinShowTime = 1.f;
NSTimeInterval const KHideAfterDelayTime = 1.f;
NSTimeInterval const kActivityMinDismissTime = 0.5f;

/** << 是否显示蒙层 default is YES > */
static const char kWBMBProgressHUDKey;

@implementation MBProgressHUD (WBAddtional)

#pragma mark --------  Basic Method   --------
+ (MBProgressHUD *)wb_showActivityMessage:(NSString *)message
                                   toView:(UIView *)view {
    
    [self wb_hideHUD];
    
    if (!view) view = [UIApplication sharedApplication].delegate.window;    /**  快速显示提示信息  */
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    /**  < 显示动画效果 >  */
    hud.animationType = MBProgressHUDAnimationZoom;
    /**  < 文字内容 >  */
    hud.label.text = message;
    /**  < 影藏后移除视图 >  */
    hud.removeFromSuperViewOnHide = YES;
    /**  中间方框背景色  */
    hud.bezelView.color = [[UIColor blackColor] colorWithAlphaComponent:0.85f];
    /**  内容颜色  */
    hud.contentColor = [UIColor whiteColor];
    /**  < 最小显示时间 >  */
    hud.minShowTime = kActivityMinDismissTime;
    objc_setAssociatedObject(self, &kWBMBProgressHUDKey, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return hud;
}

+ (MBProgressHUD *)wb_showMessage:(NSString *)message
                           toView:(UIView *)view
                       completion:(MBProgressHUDCompletionBlock)completion{
    
    [self wb_hideHUD];
    
    if (!view) view = [UIApplication sharedApplication].delegate.window;
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    hud.removeFromSuperViewOnHide = YES;
    hud.bezelView.color = [[UIColor blackColor] colorWithAlphaComponent:0.85f];
    hud.contentColor = [UIColor whiteColor];
//    hud.backgroundView.color = [[UIColor blackColor] colorWithAlphaComponent:0.4f];
    [hud hideAnimated:YES afterDelay:KHideAfterDelayTime];
    hud.minShowTime = kMinShowTime;
    hud.completionBlock = completion;
    objc_setAssociatedObject(self, &kWBMBProgressHUDKey, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return hud;
}

+ (MBProgressHUD *)wb_show:(NSString *)text
                      icon:(NSString *)icon
                      view:(UIView *)view
     completion:(MBProgressHUDCompletionBlock)completion {
    
    [self wb_hideHUD];
    
    if (view == nil) view = [UIApplication sharedApplication].delegate.window;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = text;
    UIImageView * imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@",icon]];
    hud.customView = imageView;
    hud.removeFromSuperViewOnHide = YES;
    hud.bezelView.color = [[UIColor blackColor] colorWithAlphaComponent:0.85f];
    hud.contentColor = [UIColor whiteColor];
//    hud.backgroundView.color = [[UIColor blackColor] colorWithAlphaComponent:0.4f];
    hud.minShowTime = kMinShowTime;
    [hud hideAnimated:YES afterDelay:KHideAfterDelayTime];
    hud.completionBlock = completion;
    objc_setAssociatedObject(self, &kWBMBProgressHUDKey, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return hud;
}

+ (MBProgressHUD *)wb_showSuccess:(NSString *)success
                           toView:(UIView *)view
                       completion:(MBProgressHUDCompletionBlock)completion{
    return [self wb_show:success
                    icon:@"success"
                    view:view
              completion:completion];
}

+ (MBProgressHUD *)wb_showError:(NSString *)error
                         toView:(UIView *)view
                     completion:(MBProgressHUDCompletionBlock)completion {
    return [self wb_show:error
                    icon:@"error"
                    view:view
              completion:completion];
}

+ (MBProgressHUD *)wb_showInfo:(NSString *)info
                        toView:(UIView *)view
                    completion:(MBProgressHUDCompletionBlock)completion {
    return [self wb_show:info
                    icon:@"MBHUD_Info"
                    view:view
              completion:completion];
}

+ (MBProgressHUD *)wb_showWarning:(NSString *)warning
                           toView:(UIView *)view
                       completion:(MBProgressHUDCompletionBlock)completion{
    return [self wb_show:warning
                    icon:@"MBHUD_Warn"
                    view:view
              completion:completion];
}

#pragma mark --------  Activity && Text  --------
#pragma mark
+ (MBProgressHUD *)wb_showActivity {
    MBProgressHUD *hud = [self wb_showActivityMessage:nil
                                               toView:nil];
    hud.square = YES;
    return hud;
}

+ (MBProgressHUD *)wb_showActivityMessage:(NSString *)message {
    return [self wb_showActivityMessage:message
                                 toView:nil];
}

#pragma mark --------  Text && Image  --------
#pragma mark
+ (MBProgressHUD *)wb_showSuccess:(NSString *)success
                       completion:(MBProgressHUDCompletionBlock)completion {
    return [self wb_showSuccess:success
                         toView:nil
                     completion:completion];
}

+ (MBProgressHUD *)wb_showError:(NSString *)error
                     completion:(MBProgressHUDCompletionBlock)completion{
    return [self wb_showError:error
                       toView:nil
                   completion:completion];
}

+ (MBProgressHUD *)wb_showInfo:(NSString *)info
                    completion:(MBProgressHUDCompletionBlock)completion{
    return [self wb_showInfo:info
                      toView:nil
                  completion:completion];
}

+ (MBProgressHUD *)wb_showWarning:(NSString *)warning
                       completion:(MBProgressHUDCompletionBlock)completion{
    return [self wb_showWarning:warning
                         toView:nil
                     completion:completion];
}

+ (MBProgressHUD *)wb_showMessage:(NSString *)message
                       completion:(MBProgressHUDCompletionBlock)completion{
    return [self wb_showMessage:message
                         toView:nil
                     completion:completion];
}

#pragma mark --------  Hide  --------
#pragma mark
+ (void)wb_hideHUD {
    /** << 隐藏WindowHUD > */
    MBProgressHUD *hud = objc_getAssociatedObject(self, &kWBMBProgressHUDKey);
    if (hud) {
        hud.removeFromSuperViewOnHide = YES;
        [hud hideAnimated:YES];
        objc_setAssociatedObject(self, &kWBMBProgressHUDKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

#pragma mark ------ < Event Response > ------
#pragma mark
+ (void)taped:(UITapGestureRecognizer *)sender {
    [self wb_hideHUD];
}

#pragma mark --------  Private Method  --------
#pragma mark
//获取当前屏幕显示的viewcontroller
+ (UIViewController *)wb_getCurrentWindowVc
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tempWindow in windows)
        {
            if (tempWindow.windowLevel == UIWindowLevelNormal)
            {
                window = tempWindow;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {
        result = nextResponder;
    }
    else
    {
        result = window.rootViewController;
    }
    return  result;
}

+ (UIViewController *)wb_getCurrentVc
{
    UIViewController  *superVC = [[self class]  wb_getCurrentWindowVc ];
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }else
        if ([superVC isKindOfClass:[UINavigationController class]]) {
            return ((UINavigationController*)superVC).viewControllers.lastObject;
        }
    return superVC;
}

+ (void)wb_maskLayerEnabled:(BOOL)enabled {
    if (enabled) {
        MBProgressHUD *hud = objc_getAssociatedObject(self, &kWBMBProgressHUDKey);
        hud.backgroundView.color = [[UIColor blackColor] colorWithAlphaComponent:0.4f];
    }
}

+ (void)wb_lockScreen:(BOOL)lockScreen {
    if (!lockScreen) {
        MBProgressHUD *hud = objc_getAssociatedObject(self, &kWBMBProgressHUDKey);
        if (hud) {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(taped:)];
            [hud.backgroundView addGestureRecognizer:tap];
        }
    }
}

@end
