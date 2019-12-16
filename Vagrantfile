
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.provision :shell, path: "install_tf.sh"
  config.vm.provision "file", source: ".", destination: "$HOME/TF_TALK"
  config.vm.provider "virtualbox" do |v|
        	v.memory = 4096
    		  v.cpus = 2
    end
end
