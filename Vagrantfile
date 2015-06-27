# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # config.vm.box = "u14.04_64_1"
  # with Travis:
  config.vm.box = "u12.04_64_1"

  config.vm.provision "ansible" do |ansible|
    ansible.sudo = true
    ansible.verbose = "v"
    ansible.host_key_checking = false
    ansible.playbook = "playbook_full.yml"
    
    # available in ansible 1.6
    #ansible.vault_password_file = "./vault_pass.py"
    #
    # ln -s ~/.vault_pass.py ./vault_pass.py
    ansible.raw_arguments = ["--vault-password-file", "./vault_pass.py"]
  end

  config.vm.define "strato_v3" do |strato_v3|
    strato_v3.vm.network "private_network", ip: "192.168.33.10"
  end

  config.vm.define "xenways_small" do |xenways_small|
    xenways_small.vm.network "private_network", ip: "192.168.33.11"
  end
  
end
