Start-BitsTransfer -Source https://download.virtualbox.org/virtualbox/6.1.8/VirtualBox-6.1.8-137981-Win.exe -Destination $env:USERPROFILE\Downloads\
Start-Process "$env:USERPROFILE\Downloads\VirtualBox-6.1.8-137981-Win.exe"  -ArgumentList "-extract"
msiexec /passive /i $env:LOCALAPPDATA\Temp\VirtualBox\VirtualBox-6.1.8-r137981.msi


Start-BitsTransfer -Source https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.msi -Destination $env:USERPROFILE\Downloads\
msiexec /passive /norestart /i $env:USERPROFILE\Downloads\vagrant_2.2.9_x86_64.msi

