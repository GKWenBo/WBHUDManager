# WBHUDManager

### 中文说明

MBProgressHUD、SVProgressHUD提示框架实用封装。

### Requirements

- iOS 8+
- Xcode 8+

### 安装

```
target 'WBHUDManager' do

use_frameworks!
pod 'WBHUDManager'

end
```

只安装子组件
```
target 'WBHUDManager' do

use_frameworks!
pod 'WBHUDManager/MBProgressHUDWBAddtional'

end
```

### Usage

**MBProgressHUD**
- 显示菊花
```
//只显示菊花
[MBProgressHUD wb_showActivity:self.view];

//菊花带有文字
[MBProgressHUD wb_showActivityMessage:@"加载中..."
                               toView:self.view];
```

- 成功提示
```
//成功提示
[MBProgressHUD wb_showSuccess:@"登录成功"
                       toView:self.view
                   completion:nil];
```

**SVProgressHUD**

- 文字提示
```
//文字提示
WB_SVProgressHUDManager
.wb_showTextWithStatus(@"信息提示")
.wb_setDefaultStyle(SVProgressHUDStyleDark)
.wb_dismissWithDelay(2, ^{
    NSLog(@"完成回调");
});
```
更多用法，请看下载demo查看。

### 更新日志

- 2019-12-08(1.0.2)：SVProgressHUD改为链式调用

### Author

author：wenbo   
email：wenmobo2018@gmail.com     
掘金：https://juejin.im/user/5a371ae551882512d0607108      
简书：https://www.jianshu.com/u/63445e24e8bf

### License

WBHUDManager is available under the MIT license. See the LICENSE file for more info.
