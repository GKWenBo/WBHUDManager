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
[SVProgressHUD wb_showTextWithStatus:@"信息提示"
                          completion:^{
    NSLog(@"完成回调");
}];
```
更多用法，请看下载demo查看。

### Author

author：wenmbo   
email：wenmobo2018@gmail.com

### License

WBHUDManager is available under the MIT license. See the LICENSE file for more info.
