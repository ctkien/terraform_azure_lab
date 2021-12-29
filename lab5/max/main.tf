locals {
  max = max(9, 6, 2)
}
output "list" {
  value = local.max
}

