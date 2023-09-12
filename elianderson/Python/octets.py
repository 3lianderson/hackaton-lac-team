import ci_nic_inventory

ip_address = '10.8.8.6'
# generate ci nic based on the ipaddress
#def generate_nic(ip_address):
# Split the IP address into octets
octets = ip_address.split('.')

# check 2nd octet of the IP address
if octets[1]=='9':
    # Remove the desired octet (in this case, the last octet and the 3rd octet)
    new_ip = str(f'{octets[0]}.{octets[1]}')
    # Join the remaining octets back together
    nic2 = ci_nic_inventory.nic_2_octet_names[f'{new_ip}']
    # get the nic from new ip address with 2 octets
    print(nic2) #return str(nic2)

else:
    # Remove the desired octet (in this case, the last octet)
    new_ip = str(f'{octets[0]}.{octets[1]}.{octets[2]}')
    # Join the remaining octets back together    
    nic3 = ci_nic_inventory.nic_3_octet_names[f'{new_ip}']
    # get the nic from new ip address with 3 octets
    print(nic3) #return str(nic3)
