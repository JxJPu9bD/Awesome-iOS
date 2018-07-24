#
# Be sure to run `pod lib lint CYNBaseComponent.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CYNBaseComponent'
  s.version          = '0.1.0'
  s.summary          = '基础组件依赖,可以认为是每个工程都必须依赖的'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
基础依赖:
                       DESC

  s.homepage         = 'https://github.com/孙春辉/CYNBaseComponent'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '孙春辉' => 'wxsunch@yutong.com' }
  s.source           = { :git => 'https://github.com/孙春辉/CYNBaseComponent.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CYNBaseComponent/Classes/**/*'
  
  s.resource_bundles = {
    'CYNBaseComponent' => ['CYNBaseComponent/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AFNetworking', '~> 3.2.1'
  s.dependency 'RTRootNavigationController', '~> 0.6.7'
  s.dependency 'MJExtension', '~> 3.0.13'
  s.dependency 'MJRefresh', '~> 3.1.15.3'
  s.dependency 'HHRouter'
end
