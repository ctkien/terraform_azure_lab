locals {
  prefix = split(",", "one,two,three")
}

output "list" {
  value = local.prefix
}

