Pod::Spec.new do |s|
 s.name = 'DownPicker'
 s.version = '0.7.0'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'test summary'
 s.homepage = 'https://homebase.ai'
 s.social_media_url = 'https://twitter.com/rahulkatariya91'
 s.authors = { "HomebaseAI" => "daniel.chick@homebase.ai" }
 s.source = { :git => "https://github.com/chickdan/DownPicker.git", :tag => "v"+s.version.to_s }
 s.platforms = { :ios => "9.0", :osx => "10.10", :tvos => "9.0", :watchos => "2.0" }
 s.requires_arc = true

 s.default_subspec = "Core"
 s.subspec "Core" do |ss|
     ss.source_files  = "Sources/**/*.swift"
     ss.framework  = "Foundation"
 end
end
