locals {
  flatten = flatten(var.list_input)
}
output "list" {
  value = local.flatten
}
variable "list_input" {
  type    = map(any)
  default = [["a", "b"], [], ["c"]]
}
