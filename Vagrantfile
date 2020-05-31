Vagrant.configure("2") do |config|

  config.vm.box = "bento/ubuntu-18.04"
  config.vm.box_download_insecure = true
  config.vm.define "ansible" do |v|
    v.vm.hostname= "ansible"
    v.vm.provider :virtualbox do |vb|
      vb.name = "ansible"
      # vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      # vb.customize ["modifyvm", :id, "--natdnshostresolver2", "on"]
    end
  end
  # config.vm.synced_folder "../git/ansible", "/ansible", mount_options: ['dmode=755', 'fmode=755']

  $script = <<-SHELL
  apt update
  apt install -y software-properties-common
  apt-add-repository -y ppa:ansible/ansible
  add-apt-repository -y ppa:git-core/ppa
  apt update
  apt install -y ansible sshpass whois python-jmespath putty-tools python-pyvmomi git python-pip default-jre-headless libssl-dev
  [[ ! -f /home/vagrant/bfg.jar ]] && curl https://repo1.maven.org/maven2/com/madgag/bfg/1.13.0/bfg-1.13.0.jar -o bfg.jar
  pip install ansible-lint
  pip install molecule
  # sudo -u vagrant cp -n /ansible/ansible.cfg ansible.cfg
  # sudo -u vagrant ln -s /ansible/prod prod &>/dev/null
  # sudo -u vagrant ln -s /ansible/acc acc &>/dev/null
  # sudo -u vagrant ln -s /ansible/dev dev &>/dev/null
  # sudo -u vagrant ln -s /ansible playbooks &>/dev/null
  sudo -u vagrant touch vault-pass.txt
  sudo -i -u vagrant ansible --version
  puttygen /vagrant/.vagrant/machines/ansible/virtualbox/private_key -O private -o /vagrant/.vagrant/machines/ansible/virtualbox/private_key.ppk
  SHELL

  config.vm.provision "shell", inline: $script
  config.vm.provision "ansible_local" do |ansible|
    ansible.become = true
    ansible.playbook = "ansiblevm.yml"
  end
end



