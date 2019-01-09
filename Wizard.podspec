#
# Be sure to run `pod lib lint Wizard.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Wizard'
  s.version          = '0.1.2'
  s.summary          = 'Wizard view controller for iOS.'
  
  s.ios.deployment_target = '11.0'
  s.swift_version = '4.2'
  
  s.description      = <<-DESC
  'Collection view controller with title, subtitle, image and subimages.'
                       DESC

  s.homepage         = 'https://github.com/moon4ik/Wizard'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Oleksii Mykhailenko' => 'moon4ik@gmail.com' }
  s.source           = { :git => 'https://github.com/moon4ik/Wizard.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.source_files = 'Wizard/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Wizard' => ['Wizard/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
