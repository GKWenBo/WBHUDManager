//
//  SVProgressHUDManager.m
//  WBHUDManager
//
//  Created by 文波 on 2019/12/8.
//  Copyright © 2019 文波. All rights reserved.
//

#import "WBSVProgressHUDManager.h"

@interface WBSVProgressHUDManager ()

@property (nonatomic, assign) CGFloat minimumDismissTimeInterval;
@property (nonatomic, assign) CGFloat maximumDismissTimeInterval;
@property (nonatomic, assign) CGFloat delayShowTimeInterval;

@end

@implementation WBSVProgressHUDManager

+ (instancetype)sharedManager {
    static WBSVProgressHUDManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]init];
    });
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.minimumDismissTimeInterval = 2.f;
        self.maximumDismissTimeInterval = 3.f;
        self.delayShowTimeInterval = 1.f;
        
        [SVProgressHUD setMinimumDismissTimeInterval:self.minimumDismissTimeInterval];
        [SVProgressHUD setMaximumDismissTimeInterval:self.maximumDismissTimeInterval];
    }
    return self;
}

- (WBSVProgressHUDManager * _Nonnull (^)(CGFloat))wb_delayShowTimeInterval {
    return ^(CGFloat delay) {
        self.delayShowTimeInterval = delay;
        return [WBSVProgressHUDManager sharedManager];
    };
}

- (WBSVProgressHUDManager * _Nonnull (^)(CGFloat))wb_minimumDismissTimeInterval {
    return ^(CGFloat timeInterval) {
        self.minimumDismissTimeInterval = timeInterval;
        [SVProgressHUD setMinimumDismissTimeInterval:timeInterval];
        return [WBSVProgressHUDManager sharedManager];
    };
}

- (WBSVProgressHUDManager * _Nonnull (^)(CGFloat))wb_maximumDismissTimeInterval {
    return ^(CGFloat timeInterval) {
        self.maximumDismissTimeInterval = timeInterval;
        [SVProgressHUD setMaxSupportedWindowLevel:timeInterval];
        return [WBSVProgressHUDManager sharedManager];
    };
}

- (WBSVProgressHUDManager * _Nonnull (^)(NSString * _Nonnull))wb_showInfoWithStatus {
    return ^(NSString *info) {
        [SVProgressHUD showInfoWithStatus:info];
        return [WBSVProgressHUDManager sharedManager];
    };
}

- (WBSVProgressHUDManager * _Nonnull (^)(SVProgressHUDStyle))wb_setDefaultStyle {
    return ^(SVProgressHUDStyle style) {
        [SVProgressHUD setDefaultStyle:style];
        return [WBSVProgressHUDManager sharedManager];
    };
}

- (WBSVProgressHUDManager * _Nonnull (^)(SVProgressHUDMaskType))wb_setDefaultMaskType {
    return ^(SVProgressHUDMaskType type) {
        [SVProgressHUD setDefaultMaskType:type];
        return [WBSVProgressHUDManager sharedManager];
    };
}

- (WBSVProgressHUDManager * _Nonnull (^)(CGFloat, WBSVProgressHUDDismissCompletion _Nonnull))wb_dismissWithDelay {
    return ^(CGFloat timeInterval, WBSVProgressHUDDismissCompletion completion) {
        [SVProgressHUD dismissWithDelay:timeInterval? : self.minimumDismissTimeInterval completion:completion];
        return [WBSVProgressHUDManager sharedManager];
    };
}

- (WBSVProgressHUDManager * _Nonnull (^)(NSString * _Nonnull))wb_showSuccessWithStatus {
    return ^(NSString *status) {
        [SVProgressHUD showSuccessWithStatus:status];
        return [WBSVProgressHUDManager sharedManager];
    };
}

- (WBSVProgressHUDManager * _Nonnull (^)(NSString * _Nonnull))wb_showErrorWithStatus {
    return ^(NSString *status) {
        [SVProgressHUD showErrorWithStatus:status];
        return [WBSVProgressHUDManager sharedManager];
    };
}

- (WBSVProgressHUDManager * _Nonnull (^)(NSString * _Nonnull))wb_showTextWithStatus {
    return ^(NSString *status) {
        [SVProgressHUD showImage:[UIImage imageNamed:@""] status:status];
        return [WBSVProgressHUDManager sharedManager];
    };
}

- (WBSVProgressHUDManager * _Nonnull (^)(NSString * _Nonnull, CGFloat))wb_delayShowInfoWithStatus {
    return ^(NSString *status, CGFloat delay) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay ? : self.delayShowTimeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.wb_showInfoWithStatus(status);
        });
        return [WBSVProgressHUDManager sharedManager];
    };
}

- (WBSVProgressHUDManager * _Nonnull (^)(NSString * _Nonnull, CGFloat))wb_delayShowTextWithStatus {
    return ^(NSString *status, CGFloat delay) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay ? : self.delayShowTimeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.wb_showTextWithStatus(status);
        });
        return [WBSVProgressHUDManager sharedManager];
    };
}

- (WBSVProgressHUDManager * _Nonnull (^)(NSString * _Nonnull, CGFloat))wb_delayShowErrorWithStatus {
    return ^(NSString *status, CGFloat delay) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay ? : self.delayShowTimeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.wb_showErrorWithStatus(status);
        });
        return [WBSVProgressHUDManager sharedManager];
    };
}

- (WBSVProgressHUDManager * _Nonnull (^)(NSString * _Nonnull, CGFloat))wb_delayShowSuccessWithStatus {
    return ^(NSString *status, CGFloat delay) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay ? : self.delayShowTimeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.wb_showSuccessWithStatus(status);
        });
        return [WBSVProgressHUDManager sharedManager];
    };
}

@end
