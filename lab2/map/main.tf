variable "envkey" {
  type = map(string)
  default = {
    "key1" = "value1"
    "key2" = "value2"
    "key3" = "value 3"
  }
}

output "mymapoutputwhole" {
  value = var.envkey
}
output "mymapoutputone" {
  value = var.envkey["key2"]
}
