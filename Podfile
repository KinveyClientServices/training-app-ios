# Uncomment this line to define a global platform for your project
# platform :ios, '8.0'
inhibit_all_warnings!

target 'TrainingApp' do
    
    use_frameworks!
    
	pod 'SVProgressHUD'
    pod 'Kinvey', '~> 3.2.2'

end

target 'TrainingAppTests' do

end

target 'TrainingAppUITests' do

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '2.3'
        end
    end
end
