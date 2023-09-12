import ci_nic_inventory

ip_address = '10.9.5.6'

octets = ip_address.split('.')

if octets[1]=='9':
    new_ip = str(f'{octets[0]}.{octets[1]}')
    nic2 = ci_nic_inventory.nic_2_octet_names[f'{new_ip}']
    print(nic2) #return str(nic2)

else:
    new_ip = str(f'{octets[0]}.{octets[1]}.{octets[2]}')    
    nic3 = ci_nic_inventory.nic_3_octet_names[f'{new_ip}']
    print(nic3) #return str(nic3)
