variable "simpletuple" {
  type    = tuple([string, number, bool])
  default = ["itforvn", 10, false]
}

output "vartuple" {
  value = var.simpletuple
}
output "singlevartuple" {
  value = var.simpletuple[2]
}
