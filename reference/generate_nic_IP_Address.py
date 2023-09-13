import ci_nic_inventory

# generate ci nic based on the ipaddress
def generate_nic(ip_address):
    # Split the IP address into octets
    octets = ip_address.split('.')
    print(octets)
        # check 2nd octet of the IP address
    if octets[1] == 9:
        # Remove the desired octet (in this case, the last octet and the 3rd octet)
        octets = octets[:-1]
        octets = octets[:-1]
        # Join the remaining octets back together
        new_ip_address = str('.'.join(octets))
        # get the nic from new ip address with 3 octets
        nic2 = ci_nic_inventory.nic_2_octet_names[f'{new_ip_address}']
        print(nic2)
            
    else:
        # Remove the desired octet (in this case, the last octet)
        octets = octets[:-1]
        # Join the remaining octets back together
        new_ip_address = str('.'.join(octets))
        # get the nic from new ip address with 3 octets
        nic3 = ci_nic_inventory.nic_3_octet_names[f'{new_ip_address}']
        print(nic3)
        #return str(nic3)
        


