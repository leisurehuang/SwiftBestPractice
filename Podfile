# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

def shared_pods
  pod 'PKHUD', '~> 5.0'
  pod 'R.swift', '~> 3.3'
  pod 'SnapKit', '~> 4.0'
  pod 'Kingfisher', '~> 4.1'
  pod 'Alamofire', '~> 4.5'
  pod 'PromiseKit/Alamofire', '~> 4.4'
  pod 'SwiftyJSON'
end

def testing_pods
  pod 'Quick', '~> 1.1'
  pod 'Nimble', '~> 7.0'
end

target 'BestPractice' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for BestPractice
  shared_pods
  target 'BestPracticeTests' do
    inherit! :search_paths
    # Pods for testing
    shared_pods
    testing_pods
  end

  target 'BestPracticeUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
