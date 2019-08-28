# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

target 'CoBuck' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CoBuck
  pod 'IGListKit', '3.4.0'
  pod 'Texture', '2.7'

  # Only for buck build
  pod 'PINRemoteImage', '3.0.0-beta.13'
end

#TODO CocoaPods plugin instead?
post_install do |installer|
  require 'fileutils'

  # Assuming we're at the root dir
  buck_files_dir = 'buck-files'
  if File.directory?(buck_files_dir)
    installer.pod_targets.flat_map do |pod_target|
      pod_name = pod_target.pod_name
      # Copy the file at buck-files/BUCK_pod_name to Pods/pod_name/BUCK,
      # override existing file if needed
      buck_file = buck_files_dir + '/BUCK_' + pod_name
      if File.file?(buck_file)
        FileUtils.cp(buck_file, 'Pods/' + pod_name + '/BUCK', :preserve => false)
      end
    end
  end
end
