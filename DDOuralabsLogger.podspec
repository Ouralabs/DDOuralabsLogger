Pod::Spec.new do |s|
  s.name             = "DDOuralabsLogger"
  s.version          = "0.1.0"
  s.summary          = "The official Ouralabs integration for CocoaLumberjack"
  s.homepage         = "https://github.com/ouralabs/DDOuralabsLogger"
  s.license          = 'MIT'
  s.author           = { "Ouralabs" => "support@ouralabs.com" }
  s.source           = { :git => "https://github.com/ouralabs/DDOuralabsLogger.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ouralabs'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/DDOuralabsLogger.{h,m}'

  s.dependency 'CocoaLumberjack'
  s.dependency 'Ouralabs'
end
