//
//  SVProgressHUDManager.h
//  WBHUDManager
//
//  Created by 文波 on 2019/12/8.
//  Copyright © 2019 文波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SVProgressHUD/SVProgressHUD.h>

#define WB_SVProgressHUDManager [WBSVProgressHUDManager sharedManager]

NS_ASSUME_NONNULL_BEGIN
typedef void(^WBSVProgressHUDDismissCompletion)(void);

@interface WBSVProgressHUDManager : NSObject

+ (instancetype)sharedManager;

/// 最少显示时长 default：2s
@property (nonatomic, copy, readonly) WBSVProgressHUDManager*(^wb_minimumDismissTimeInterval)(CGFloat);

/// 最多显示时长 default：3s
@property (nonatomic, copy, readonly) WBSVProgressHUDManager*(^wb_maximumDismissTimeInterval)(CGFloat);

/// 延迟显示时长，解决有时显示不出问题 default：1s
@property (nonatomic, copy, readonly) WBSVProgressHUDManager*(^wb_delayShowTimeInterval)(CGFloat);

/// 设置样式 default：SVProgressHUDStyleLight
@property (nonatomic, copy, readonly) WBSVProgressHUDManager*(^wb_setDefaultStyle)(SVProgressHUDStyle);

/// 遮罩样式
@property (nonatomic, copy, readonly) WBSVProgressHUDManager *(^wb_setDefaultMaskType)(SVProgressHUDMaskType);

/// 消失完成回调
@property (nonatomic, copy, readonly) WBSVProgressHUDManager *(^wb_dismissWithDelay)(CGFloat, _Nullable WBSVProgressHUDDismissCompletion);

/// 成功提示
@property (nonatomic, copy, readonly) WBSVProgressHUDManager*(^wb_showSuccessWithStatus)(NSString *);

/// 信息提示
@property (nonatomic, copy, readonly) WBSVProgressHUDManager*(^wb_showInfoWithStatus)(NSString *);

/// 错误提示
@property (nonatomic, copy, readonly) WBSVProgressHUDManager*(^wb_showErrorWithStatus)(NSString *);

/// 文字提示
@property (nonatomic, copy, readonly) WBSVProgressHUDManager*(^wb_showTextWithStatus)(NSString *);

/// 延迟提示
@property (nonatomic, copy, readonly) WBSVProgressHUDManager*(^wb_delayShowSuccessWithStatus)(NSString *, CGFloat delay);
@property (nonatomic, copy, readonly) WBSVProgressHUDManager*(^wb_delayShowInfoWithStatus)(NSString *, CGFloat delay);
@property (nonatomic, copy, readonly) WBSVProgressHUDManager*(^wb_delayShowErrorWithStatus)(NSString *, CGFloat delay);
@property (nonatomic, copy, readonly) WBSVProgressHUDManager*(^wb_delayShowTextWithStatus)(NSString *, CGFloat delay);

@end

NS_ASSUME_NONNULL_END
