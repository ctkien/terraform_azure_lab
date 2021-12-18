variable "listofstrings" {
  type    = list(any)
  default = ["one", "two", "1", "2"]
}
output "listofstrings" {
  value = var.listofstrings
}
output "singlevaluefromlistofstrings" {
  value = var.listofstrings[1]
}
variable "simpletuple" {
  type    = tuple([string, number, bool])
  default = ["ritesh", 10, false]
}
