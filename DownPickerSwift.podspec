Pod::Spec.new do |s|
 s.name = 'DownPickerSwift'
 s.version = '1.0.0'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'DownPickerSwift is an extremely light-weight class library for creating DropDownList / ComboBox controls for iOS.'
 s.homepage = 'https://homebase.ai'
 s.social_media_url = 'https://twitter.com/HomebaseAI'
 s.authors = { "HomebaseAI" => "daniel.chick@homebase.ai" }
 s.source = { :git => "https://github.com/HomebaseAI/DownPickerSwift.git", :tag => s.version.to_s }
 s.platforms = { :ios => "9.0"}
 s.requires_arc = true

 s.default_subspec = "Core"
 s.subspec "Core" do |ss|
     ss.source_files  = "Sources/**/*.swift"
     ss.framework  = "Foundation"
 end
end
