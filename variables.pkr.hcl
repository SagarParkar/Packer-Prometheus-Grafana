variable "project" {
  default = "mystic-impulse-384712"
}
variable "vm_image_name" {
  default = "sparkar-airbyte-packer-{{timestamp}}"
}
variable "source_image_name" {
  default = "debian-11-bullseye-v20230411"
}
variable "zone" {
  default = "europe-west1-b"
}
variable "ssh_username" {
  default = "sparkar"
}
#variable "account_key" {
#  default = "cosmic-abbey.json"
#}