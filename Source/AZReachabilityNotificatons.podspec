
Pod::Spec.new do |s|


  s.name         = "AZReachabilityNotificatons"
  s.version      = "0.1.0"
  s.summary      = "JersLayality asdsd"

  s.description  = "blakdajdajdasjdqwehqioweuyqwiueyuisdyiusydiasydiasuydiousadyisauyd"

  s.homepage     = "http://www.google.com"


  s.license      = "MIT"


  s.author             = { "" => "" }

  s.source       = { :git => "." }
  s.platform     = :ios, "9.0"


 
  s.source_files = 'AZReachabilityNotificatons/**/*.{swift}'
#s.resource_bundles = {
 #    'JetsLoyaltyElements' => ['Pod/**/*.{storyboard,xib,xcassets,otf}']
 # }


 # s.resources    = 'Pod/StoryBoards/JetsLoyalty.storyboard'

  s.dependency  "Alamofire"
  s.dependency  "CWStatusBarNotification"
  s.dependency  "Whisper"

end
