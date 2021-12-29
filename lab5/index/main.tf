locals {
  prefix = index(var.list_input, "a")
}
output "list" {
  value = local.prefix
}
variable "list_input" {
  type    = list(string)
  default = ["a", "b", "c"]
}
