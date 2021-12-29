variable "names" {
  description = "A list of names"
  type        = list(string)
  default     = ["Tobby", "Garfield", "Tom"]
}

output "upper_case" {
  value = [for name in var.names : upper(name)]
}
output "name" {
  value = var.names
}
