data "aws_key_pair" "conduit" {
  key_name = "conduit-joy-test-keypair"
}

data "aws_vpc" "sandbox" {
  id = var.vpc_id
}