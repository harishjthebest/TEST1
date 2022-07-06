 module "configuration1" {
 source = "./NIC"
  nic = "Test_nic"
  ipconfig = "testip"
  vsubid = module.configuration4.vsubid
  location = "eastus"
  rg = module.configuration2.rgid
}
module "configuration2" {
  source = "./Resource_Group"
  resource_group = "TestRG"
  location = "eastus"
  }

module "configuration3" {
  source = "./VM"
  vm= "TESTVM"
  size = "standard_f2"
  vmuser_name = "testweb1"
  user_password = "test@2022"
  rights = "ReadWrite"
  storage = "Standard_LRS"
  micsft = "microsoftwindowsserver"
  win = "windowsserver"
  vmwin_versing = "2016-datacenter"
  location = "eastus"
  rg = module.configuration2.rgid
  nic = module.configuration1.nicid
}
module "configuration4" {
  source = "./VNet"
  vnet = "testvnet"
  cidr_block = "196.168.0.0/16"
  vsub = "anjisubnet"
  ip_address = "196.168.2.0/24"
  location = "eastus"
  rg = module.configuration2.rgid
}