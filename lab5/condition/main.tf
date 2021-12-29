output "one" {
  value = 1 == 2 ? "is true" : "is false"
}

output "contain" {
  value = contains(["a", "b", "c"], "c") ? "is true" : "is false"
}

output "key" {
  value = keys({ a : 1, b : 2, c : 3 }) == ["a", "b", "c"] ? "is true" : "is false"
}
