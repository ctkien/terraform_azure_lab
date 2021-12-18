variable "myEmployeeObject" {
  type = object({
    name       = string
    age        = number
    is_married = bool
    companies  = map(string)
    schools    = list(string)
  })
  default = {
    name       = "ritesh"
    age        = 25
    is_married = true
    companies = {
      "company1" = "abcd"
      "2company" = "xyz"
    }
    schools = [
      "school1",
    "school2"]
  }
}
