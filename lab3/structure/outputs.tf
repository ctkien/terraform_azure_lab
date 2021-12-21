output "password" {
  value     = random_password.password.result
  sensitive = true
}
output "public_ip" {
  value = azurerm_public_ip.example.ip_address
}
