import ci_nic_inventory
def generate_nic(ip_address):
    # Split the IP address into octets
    # check 2nd octet of the IP address
        # Remove the desired octet (in this case, the last octet and the 3rd octet)
        # Join the remaining octets back together
        # get the nic from new ip address with 3 octets
        # Remove the desired octet (in this case, the last octet)
        # Join the remaining octets back together
        # get the nic from new ip address with 3 octets

    oct=ip_address.split('.')
    nip=(oct[0],oct[1])
    nipa=((oct[0],oct[1],oct[2]))
    if oct[1]=='9':
        newip='.'.join(nip)
        nic2=ci_nic_inventory.nic_2_octet_names[f'{newip}']
        return nic2
    else:
        newnipa='.'.join(nipa)
        nic3=ci_nic_inventory.nic_3_octet_names[f'{newnipa}']
        return nic3