# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

def react_native
  pod 'yoga',   :path => './node_modules/react-native/ReactCommon/yoga'
  pod 'React',  :path => './node_modules/react-native',
      :subspecs => [
          'Core',
          'CxxBridge',
          'DevSupport',
          'tvOS',
          'jschelpers',
          'jsinspector',
          'PrivateDatabase',
          'cxxreact',
          'ART',
          'RCTActionSheet',
          'RCTAnimation',
          'RCTBlob',
          'RCTCameraRoll',
          'RCTGeolocation',
          'RCTImage',
          'RCTNetwork',
          'RCTPushNotification',
          'RCTSettings',
          'RCTText',
          'RCTVibration',
          'RCTWebSocket',
          'fishhook',
          'RCTLinkingIOS',
          'RCTTest',
          '_ignore_me_subspec_for_linting_',
      ]
  pod 'DoubleConversion', :podspec => './node_modules/react-native/third-party-podspecs/DoubleConversion.podspec'
  pod 'glog', :podspec => './node_modules/react-native/third-party-podspecs/glog.podspec'
  pod 'Folly', :podspec => './node_modules/react-native/third-party-podspecs/Folly.podspec'
end

target 'Awesome-iOS' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for Awesome-iOS
  
  react_native

  pod 'Texture', '~> 2.7'
  pod 'JPush', '~> 3.0.9'
  pod 'CYNBaseComponent', :path => './Library/ObjC/CYNBaseComponent/'

end
