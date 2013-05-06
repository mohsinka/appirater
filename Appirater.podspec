Pod::Spec.new do |s|
  s.name              = 'Appirater'
  s.version           = '1.0.3'
  s.platform          = :ios
  s.summary           = "A utility that reminds your iPhone app's users to review the app."
  s.homepage          = 'http://arashpayan.com/blog/2009/09/07/presenting-appirater/'
  s.author            = { 'Arash Payan' => 'arash.payan@gmail.com' }
  s.source            = { :git => 'https://github.com/soundcloud/appirater.git', :tag => '1.0.3' }
  s.source_files      = 'Classes'
  s.requires_arc      = true
  s.preserve_paths    = 'Resources'
  s.frameworks        = 'CFNetwork', 'SystemConfiguration'
  s.weak_framework    = 'StoreKit'
  s.license           = { :type => 'MIT', :text => 'Copyright 2012. Arash Payan. This library is distributed under the terms of the MIT/X11.' }

  def s.post_install(target_installer)
    puts "\nGenerating appirater resources bundle\n".green
    if Version.new(Pod::VERSION) >= Version.new('0.16.999')
      script_path = target_installer.copy_resources_script_path
    else
      script_path = File.join(config.project_pods_root, target_installer.target_definition.copy_resources_script_name)
    end
    File.open(script_path, 'a') do |file|
      file.puts "install_resource 'appirater/Resources/appiraterResources.bundle'"
    end
  end
end
