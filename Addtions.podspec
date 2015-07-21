#
#  Be sure to run `pod spec lint Addtions.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  
  s.name         = "Addtions"
  s.version      = "0.0.1"
  s.summary      = "GSTF‘s Categories"

  s.description  = <<-DESC
                   A longer description of Addtions in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "https://github.com/guoshengtianfeng/Addtions"
  
  s.license      = "MIT (example)"

  s.author             = { "guoshengtianfeng" => "apps@source3g.com" }

  s.source       = { :git => "https://github.com/guoshengtianfeng/Addtions.git", :tag => "0.0.1" }

  s.source_files  = "Classes", "Source/*.{h,m}"
  #s.exclude_files = "Classes/Exclude"

end
