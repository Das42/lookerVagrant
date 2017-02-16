Vagrant.configure("2") do |config|
	config.vm.define "db" do |db|
		db.vm.box = "ubuntu/trusty64"
		db.vm.network "private_network", ip: "192.168.56.101"
		db.vm.provider "virtualbox" do |vb|
			vb.memory = "1024"
		end
		db.vm.provision "shell", path: "provisionDB.sh"
   	end
   	config.vm.define "lookerbox" do |lookerbox|
   		lookerbox.vm.box = "ubuntu/trusty64"
   		lookerbox.vm.network "private_network", ip: "192.168.56.110"
   		lookerbox.vm.provider "virtualbox" do |vb2|
   			vb2.memory = "4096"
   			vb2.cpus = "2"
   		end
   		lookerbox.vm.provision "shell", path: "provisionLooker_1.sh"
   		lookerbox.vm.provision "shell", path: "provisionLooker_2.sh", run: "always"
   	end
end

