# Pre-Reqs
[GIT](https://git-scm.com/download/win)  
[Ansible Repo]()  cloned to %userprofile%\Documents\GitHub\ansible  
[puTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)

# Install Requirements

[VirtualBox](https://www.virtualbox.org/wiki/Downloads)  
[Vagrant](https://www.vagrantup.com/downloads.html)  
`powershell.exe -ExecutionPolicy Bypass -File requirements.ps1`

# Setup
*  `cd $env:userprofile\Documents`
*  `git clone https://github.com/zyphermonkey/vagrant-ansible.git`
*  `cd vagrant-ansible`
*  `vagrant up ansible`

# Configure Putty Profile  
*   vagrant@127.0.0.1:2222  
*   Connection>SSH>Auth  
    *    [X] Allow agent forwarding  
    *    Privatekey file for authentication  
         *    %userprofile%\Documents\Vagrant\\.vagrant\machines\ansible\virtualbox\private_key.ppk  
*   Save  

# Configure Ansible
*   ssh to the new ansible vm  
*   ` vi vault-pass.txt`  
    *   Type in the Vault password and save  

# Check Ansible Connectivity
`ansible-playbook -i prod playbooks/ping.yml --limit git`

# Update
*  `git pull`
*  `vagrant box update`
*  `vagrant reload --provision`
