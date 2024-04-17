Pod::Spec.new do |s|
 s.name = 'DownPickerSwift'
 s.version = '3.0.1'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'DownPickerSwift is an extremely light-weight class library for creating DropDownList / ComboBox controls for iOS.'
 s.homepage = 'https://github.com/HomebaseAI/DownPickerSwift'
 s.social_media_url = 'https://twitter.com/HomebaseAI'
 s.authors = { "HomebaseAI" => "daniel.chick@homebase.ai" }
 s.source = { :git => "https://github.com/HomebaseAI/DownPickerSwift.git", :tag => s.version.to_s }
 s.platforms = { :ios => "12.0"}
 s.swift_versions = ['5.0']

 s.default_subspec = "Core"
 s.subspec "Core" do |ss|
     ss.source_files  = "Sources/**/*.swift"
 end

 s.resource_bundle = {
     "DownPicker_Privacy" => "PrivacyInfo.xcprivacy"
 }
end
