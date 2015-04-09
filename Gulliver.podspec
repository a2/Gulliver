Pod::Spec.new do |s|
  s.name         = "Gulliver"
  s.version      = "0.0.1"
  s.summary      = "A Swift wrapper for the iOS AddressBook framework."
  s.homepage     = "https://github.com/a2/Gulliver"
  s.license      = "MIT"
  s.author           = { "Alexsander Akers" => "me@a2.io" }
  s.social_media_url = "http://twitter.com/a2"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/a2/Gulliver.git", :tag => "v#{s.version}" }
  s.source_files = "Gulliver/*.swift"
  s.requires_arc = true
  s.dependency     "Lustre", "~> 0.6.1"
end
