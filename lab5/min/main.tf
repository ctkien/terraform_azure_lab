locals {
  min = min(9, 6, 2)
}
output "list" {
  value = local.min
}
