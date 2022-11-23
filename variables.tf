variable "github_token" {
  type      = string
  sensitive = true
}

variable "vpc_id" {
  type      = string
  default   = "vpc-0a35b7bb4768ef277"
  sensitive = true
}

variable "public_subnet_id" {
  type      = string
  default   = "subnet-062b3ca09d42679b8"
  sensitive = true
}

variable "cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "ipv6_cidr_blocks" {
  type = list(string)
  default = ["::/0"]
}
