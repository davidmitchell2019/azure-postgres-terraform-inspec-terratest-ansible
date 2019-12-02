#test to see that the vnet is created, its location and the subnet
control "vnet" do
  describe azurerm_virtual_network(resource_group: input('resource_group'), name: 'vnet') do
      it               { should exist }
      its('location')  { should eq 'uksouth' }
      its('address_space') { should eq ["10.10.10.0/24"] }
    end
end
#test to see that the subnet is created, its type and its address prefix
control "subnet" do
  describe azurerm_subnet(resource_group: input('resource_group'), vnet: 'vnet', name: 'subnet') do
      it { should exist }
      its('type') { should eq 'Microsoft.Network/virtualNetworks/subnets' }
      its('address_prefix') { should eq "10.10.10.0/24" }
    end
end
#test to see that the security group is created, its rules are not empty, and that it is not open to the internet for ssh and rdp
control "security-group" do
  describe azurerm_network_security_group(resource_group: input('resource_group'), name: 'nsg') do
      it { should exist }
      its('security_rules') { should_not be_empty }
      it { should_not allow_ssh_from_internet }
      it { should_not allow_rdp_from_internet }
    end
end
