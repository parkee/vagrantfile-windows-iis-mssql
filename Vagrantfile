# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
require 'open-uri'

def download(filePath, url)
  puts "Downloading #{url} to #{filePath}"
  f = open(url)
  IO.copy_stream(f, filePath)
end

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

if ! File.exists?('./NDP452-KB2901907-x86-x64-AllOS-ENU.exe')
  puts '.Net 4.5.2 installer could not be found!'
  download('./NDP452-KB2901907-x86-x64-AllOS-ENU.exe', 'http://download.microsoft.com/download/E/2/1/E21644B5-2DF2-47C2-91BD-63C560427900/NDP452-KB2901907-x86-x64-AllOS-ENU.exe')
end

if ! File.exists?('./BuildTools_Full.exe')
  puts 'Microsoft Build Tools installer could not be found!'
  download('./BuildTools_Full.exe', 'https://download.microsoft.com/download/E/E/D/EEDF18A8-4AED-4CE0-BEBE-70A83094FC5A/BuildTools_Full.exe')
end

if ! File.exists?('./SQLEXPRADV_x64_ENU.exe')
  puts 'SQL Server installer could not be found!'
  download('./SQLEXPRADV_x64_ENU.exe', 'https://download.microsoft.com/download/E/A/E/EAE6F7FC-767A-4038-A954-49B8B05D04EB/ExpressAdv%2064BIT/SQLEXPRADV_x64_ENU.exe')
end


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|  

  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = "http://localhost:3128/"
    config.proxy.https    = "http://localhost:3128/"
    config.proxy.no_proxy = "localhost,127.0.0.1,.example.com"
  end 
  
  config.vm.box_download_insecure = true
  config.vm.box = "mwrock/Windows2012R2"
  config.vm.guest = :windows
  
  config.vm.communicator = "winrm"
  
  config.vm.network "private_network", ip: "192.168.123.123"
  config.vm.network :forwarded_port, guest: 1025, host: 1025
  config.vm.network :forwarded_port, guest: 1433, host: 1433
  config.vm.network :forwarded_port, guest: 3389, host: 3389
  config.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true
 
  # .NET 4.5
  config.vm.provision :shell, path: "vagrant-scripts/install-dot-net.ps1"  
  #config.vm.provision :shell, path: "vagrant-scripts/install-dot-net-45.cmd"
  config.vm.provision :shell, path: "vagrant-scripts/install-msbuild-tools-2013.cmd"
  
  # Database
  config.vm.provision :shell, path: "vagrant-scripts/install-sql-server.cmd" 
  config.vm.provision :shell, path: "vagrant-scripts/configure-sql-server.ps1"  
  
  #Restore DB
  config.vm.provision :shell, path: "vagrant-scripts/create-database.cmd"
   
  #Enable RDP
  config.vm.provision :shell, path: "vagrant-scripts/enable-rdp.ps1"

  # IIS   
  config.vm.provision :shell, path: "vagrant-scripts/install-iis.cmd"
    
  #Create Website
  #config.vm.provision :shell, path: "vagrant-scripts/copy-website.ps1"
  ##config.vm.provision :shell, path: "vagrant-scripts/build-website.cmd"
  #config.vm.provision :shell, path: "vagrant-scripts/creating-website-in-iis.cmd"
  #config.vm.provision :shell, path: "vagrant-scripts/setup-permissions-for-website-folder.ps1"
  
end
