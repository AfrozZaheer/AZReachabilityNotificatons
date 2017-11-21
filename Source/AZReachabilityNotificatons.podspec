
Pod::Spec.new do |s|


  s.name         = "AZReachabilityNotificatons"
  s.version      = "0.2.0"
  s.summary      = "Internet Notifications"

  s.description  = <<-DESC
        Show Internet notifications with Reachability 
  DESC
  s.homepage     = "https://github.com/AfrozZaheer/AZReachabilityNotificatons"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "AfrozZ" => "afrozezaheer@gmail.com" }

  s.source       = { :git => "https://github.com/AfrozZaheer/AZReachabilityNotificatons.git" }
  s.platform     = :ios, "9.0"
 
  s.source_files = 'AZReachabilityNotificatons/**/*.{swift}'

  s.dependency  "Alamofire"
  s.dependency  "CWStatusBarNotification"
  s.dependency  "Whisper"

end
