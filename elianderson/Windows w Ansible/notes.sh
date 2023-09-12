Install Python
Install Pip
Install Ansible
Install PYwinRM

Command to check how to connect with a computer by Ansible

winrm enumerate winrm/config/Listener

mecanismos de autenticação atualmente configurados

winrm get winrm/config/Service

Ativar o CREDSSP

https://docs.ansible.com/ansible/latest/os_guide/windows_setup.html#setup-winrm-listener

https://raw.githubusercontent.com/AlbanAndrieu/ansible-windows/master/files/ConfigureRemotingForAnsible.ps1

[Run in the Client Machine]
wget https://raw.githubusercontent.com/AlbanAndrieu/ansible-windows/master/files/ConfigureRemotingForAnsible.ps1 -OutFile ConfigureRemote.ps1
.\ConfigureRemote.ps1 -EnableCredSSP -DisableBasicAuth -Verbose
Get-ChildItem -Path WSMan:\localhost\Listener | Where-Object { $_.Keys -contains "Transport=HTTP" } | Remove-Item -Recurse -Force
restart-service winrm
winrm enumerate winrm/config/Listener
winrm get winrm/config/Service
echo end

[master]
54.234.218.141

[workers]
44.212.6.40
3.84.162.55

[windows_servers:children]
master
workers

[windows_servers:vars]
ansible_user="Administrator"
ansible_password=43r4t5fertygre
ansible_connection=winrm
ansible_winrm_transport=credssp
ansible_winrm_server_cert_validation=ignore


=======================
ansible windows_servers -m win_ping
===============


5200 - Julho
4150 - Agosto