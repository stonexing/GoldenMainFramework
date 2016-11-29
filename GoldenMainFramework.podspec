Pod::Spec.new do |s|

 
  s.name         = "GoldenMainFramework"
  s.version      = "0.0.1"
  s.summary      = "GoldenMainFramework支持swift3.0"


  s.description  = <<-DESC
                    使用ICSMainFramework但不支持swift3.0
                    那你就换用GoldenMainFramework吧
                    这个类库支持swift 3.0
                   DESC

  s.homepage     = "https://github.com/stonexing/GoldenMainFramework"


  s.license      = "MIT"


  s.author             = { "stonexing" => "stonexing5@gmail.com" }
  

  s.platform     = :ios, "8.0"



  s.source       = { :git => "https://github.com/stonexing/GoldenMainFramework.git", :tag => "#{s.version}" }


  s.source_files  = "Classes", "Classes/**/*.{h,m,swift}"

  s.public_header_files = "Classes/**/*.h"



end
