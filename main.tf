locals {
  tags = {
    costgroup = "digital"
    owner     = "joy"
    env       = "dev"
    Name      = "conduit-joy"
  }
}
module "github" {
  source = "./modules/github"
  token  = var.github_token
}

data "aws_key_pair" "conduit" {
  key_name = "conduit-joy-test-keypair"
}

resource "aws_instance" "this" {
  ami                         = "ami-06bb074d1e196d0d4"
  instance_type               = "t2.micro"
  subnet_id                   = var.public_subnet_id
  user_data                   = file("./bootstrap.sh")
  user_data_replace_on_change = true
  key_name                    = data.aws_key_pair.conduit.key_name
#  security_groups             = [
#    aws_security_group.allow_all_ssh.name,
#    aws_security_group.allow_all_http.name,
#    aws_security_group.allow_all_https.name
#  ]

  vpc_security_group_ids = [
    aws_security_group.allow_all_http.id,
    aws_security_group.allow_all_https.id,
    aws_security_group.allow_all_ssh.id
  ]

  tags = local.tags
}

data "aws_vpc" "sandbox" {
  id = var.vpc_id
}

resource "aws_security_group" "allow_all_ssh" {
  name        = "allow_all_ssh"
  description = "Allow all SSH inbound traffic"
  vpc_id      = var.vpc_id


  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }

  tags = local.tags
}

resource "aws_security_group" "allow_all_http" {
  name        = "allow_all_http"
  description = "Allow all HTTP inbound and outbound"
  vpc_id      = var.vpc_id


  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }

  tags = local.tags
}
resource "aws_security_group" "allow_all_https" {
  name        = "allow_all_https"
  description = "Allow all HTTPS inbound and outbound"
  vpc_id      = var.vpc_id


  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }

  tags = local.tags
}