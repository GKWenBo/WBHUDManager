Pod::Spec.new do |s|
  s.name             = 'WBHUDManager'
  s.version          = '1.0.0'
  s.summary          = 'iOS 基于SVProgressHUD、MBProgressHUD提示框封装'
  s.homepage         = 'https://github.com/wenmobo/WBHUDManager'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wenmobo' => 'wenmobo2018@gmail.com' }
  s.source           = { :git => 'https://github.com/wenmobo/WBHUDManager.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.source_files =  'WBHUDManager/WBHUDManager.h'
  s.frameworks = 'UIKit'
  
  s.subspec 'SVProgressHUDWBAddtional' do |ss|
      ss.source_files = 'WBHUDManager/SVProgressHUDWBAddtional/*.{h,m}'
      ss.dependency 'SVProgressHUD'
  end
  
  s.subspec 'MBProgressHUDWBAddtional' do |ss|
      ss.source_files = 'WBHUDManager/MBProgressHUDWBAddtional/*.{h,m}'
      ss.resource = 'WBHUDManager/MBProgressHUDWBAddtional/MBProgressHUD.bundle'
      ss.dependency 'MBProgressHUD'
  end

end
