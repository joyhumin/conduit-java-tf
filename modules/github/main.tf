locals {
  file_path = "${path.root}/artifact"
  repo = data.github_release.conduit
}
data "github_release" "conduit" {
  repository  = "conduit_typescript_java_bdd"
  owner       = "joyhumin"
  retrieve_by = "latest"
}

resource "null_resource" "artifact" {
  provisioner "local-exec" {
    //noinspection HILUnresolvedReference
    command = "rm -rf *.zip; curl -L ${local.repo.assets[0].browser_download_url} > ${local.file_path}-${local.repo.release_tag}.zip "
  }
}

output "path_module" {
  value = path.module
}

output "path_root" {
  value = path.root
}

output "path_cwd" {
  value = path.cwd
}
