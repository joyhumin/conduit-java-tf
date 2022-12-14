output "path_module" {
  value = path.module
}

output "path_root" {
  value = path.root
}

output "path_cwd" {
  value = path.cwd
}

output "module_module" {
  value = module.github.path_module
}

output "module_root" {
  value = module.github.path_root
}

output "ec2_ip" {
  value = aws_instance.this.public_ip
}