locals {
  prefix = length(var.list_input)
}
output "list" {
  value = local.prefix
}
variable "list_input" {
  type    = list(string)
  default = ["a", "b", "c", "d"]
}
