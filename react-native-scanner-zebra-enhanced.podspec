require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = package['name']
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']

  s.authors      = { "Crypton" => "info@crypton.nl" }
  s.homepage     = package['homepage']
  s.platform     = :ios, "13.4"

  s.source       = { :git => "https://github.com/intellidev1991/react-native-scanner-zebra-enhanced.git", :tag => "v#{s.version}" }
  s.source_files  = "ios/**/*.{h,m,swift}"
  s.ios.vendored_library = 'ios/libs/libZebraSdk.a'
  s.ios.framework = 'ExternalAccessory', 'CoreBluetooth'
  s.dependency 'React'

  s.pod_target_xcconfig = { 
  'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' 
  }
  s.user_target_xcconfig = { 
  'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
end