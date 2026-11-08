output "vm_name" {
  description = "Nome da máquina virtual"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "public_ip_address" {
  description = "IP público da máquina virtual"
  value       = azurerm_public_ip.public_ip.ip_address
}

output "network_interface_name" {
  description = "Nome da interface de rede associada à VM"
  value       = azurerm_network_interface.nic.name
}

output "vm_private_ip" {
  description = "Endereço IP privado da VM"
  value       = azurerm_network_interface.nic.private_ip_address
}