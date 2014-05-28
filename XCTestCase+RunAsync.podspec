#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "XCTestCase+RunAsync"
  s.version          = "0.1.0"
  s.summary          = "A short description of XCTestCase+RunAsync."
  s.homepage         = "http://EXAMPLE/NAME"
  s.license          = 'MIT'
  s.author           = { "azu" => "azuciao@gmail.com" }
  s.source           = { :git => "http://EXAMPLE/NAME.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/azu_re'

  s.platform     = :ios, '5.0'
  s.requires_arc = true

  s.source_files = 'Classes/**/*'
  s.dependency 'NSRunLoop+PerformBlock'
  s.framework = "XCTest"
end
