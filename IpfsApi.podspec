#
# Be sure to run `pod lib lint IpfsApi.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IpfsApi'
  s.version          = '0.2.0'
  s.summary          = 'A wrapper of the IPFS Client HTTP-API for iOS.'
  s.module_name   = 'Ipfs'
  s.description      = <<-DESC
A client library for the IPFS HTTP API, implemented in Swift. Check out IPFS Docs(https://ipfs.io/docs/api/) for the full command reference.
                       DESC

  s.homepage         = 'https://github.com/kjaylee/ios-ipfs-api'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kjaylee' => 'k.jaylee@gmail.com' }
  s.source           = { :git => 'https://github.com/kjaylee/ios-ipfs-api.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/kjaylee'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.swift_version = '4.1'
  s.source_files = 'IpfsApi/Classes/*.swift'
  
  # s.resource_bundles = {
  #   'IpfsApi' => ['IpfsApi/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Moya', '~> 11.0'
end
