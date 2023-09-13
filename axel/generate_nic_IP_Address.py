import ci_nic_inventory

# Separate NIC
def generate_nic(ip_address):
    octets = ip_address.split('.')
    return octets

# Nic_2
for ip_address, label in ci_nic_inventory.nic_2_octet_names.items():
    octets = generate_nic(ip_address)
    if octets[1] == '9':
        octets = octets[:-2]
    new_ip = '.'.join(octets)
    print(f"Original NIC2: {ip_address}  New NIC: {new_ip} {label}")

# Nic_3
for ip_address, label in ci_nic_inventory.nic_3_octet_names.items():
    octets = generate_nic(ip_address)
    if octets[1] != '9':
        octets = octets[:-1]
    new_ip = '.'.join(octets)
    print(f"Original NIC3: {ip_address} New NIC: {new_ip} {label}")