# Uncomment the next line to define a global platform for your project
 platform :ios, '16.0'

#use_moduler_headers!
workspace 'Starzplay-Assignment.xcworkspace'
project 'Starzplay-Assignment.xcodeproj'

use_frameworks!

def networking_pod
  pod 'NetworkingLibrary', :path => 'DevPods/sp-networking-library'
end

def common_pod
  networking_pod
end

target 'Starzplay-Assignment' do
  common_pod
  pod 'Kingfisher'
end

target 'NetworkingLibrary_Example' do
  project 'DevPods/sp-networking-library/Example/NetworkingLibrary.xcodeproj'
end

  target 'Starzplay-AssignmentTests' do
    inherit! :search_paths
    # Pods for testing
    common_pod
  end

  target 'Starzplay-AssignmentUITests' do
    # Pods for testing
  end


