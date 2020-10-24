#
# Be sure to run `pod lib lint objective-extensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "objective-extensions"
  s.version          = "0.1.2"
  s.summary          = "utility functions added to common objective c classes"

  s.description      = <<-DESC
                       Objective-extensions is a library of helper functions added to objective-c base types. 
                       Including: 
                        [NSArray forEach], 
                        [NSDictionary forEachKey], 
                        [NSObject forEachProperty]

                        [UIColor colorWithHex:]

                      Plus, many others not documented here.

                       DESC


  s.homepage         = "https://github.com/kezzico/objc-ext"
  s.license          = 'MIT'
  s.author           = { "Lee Irvine" => "loofy2@gmail.com" }
  s.source           = { :git => "https://github.com/kezzico/objc-ext.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'objective-extensions' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'

end
