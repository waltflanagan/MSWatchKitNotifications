#
# Be sure to run `pod lib lint MSWatchKitNotifications.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MSWatchKitNotifications"
  s.version          = "1.0.1"
  s.summary          = "WKInterfaceController+UILocalNotification"
  s.description      = <<-DESC
                      MSWatchKitNotifications allows you to schedule UILocalNotifications from WKInterfaceController.

                      UILocalNotifications are serialized to NSData and passed to the parent app via openParentApplication:reply:
                       DESC
  s.homepage         = "https://github.com/waltflanagan/MSWatchKitNotifications"
  s.license          = 'MIT'
  s.author           = { "Mike Simons" => "mike@fermentedcode.com" }
  s.source           = { :git => "https://github.com/waltflanagan/MSWatchKitNotifications.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/waltflanagan'

  s.platform     = :ios, '8.2'
  s.requires_arc = true

  s.subspec 'App' do |sp|
    sp.source_files = 'Pod/Classes/App/**/*.{h,m}'
    sp.dependency 'MSWatchKitNotifications/Core'
  end

  s.subspec 'Core' do |sp|
    sp.public_header_files = 'Pod/Classes/Core/MSWatchKitNotifications.h'
    sp.source_files = 'Pod/Classes/Core/**/*.{h,m}'
  end

  s.subspec 'Extension' do |sp|
    sp.source_files = 'Pod/Classes/Extension/**/*.{h,m}'
    sp.dependency 'MSWatchKitNotifications/Core'
  end

  s.default_subspecs = 'App'

end
