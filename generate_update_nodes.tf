data "template_file" "ose_nodes_config" {
  template = "${file("${path.cwd}/template/update_nodes.sh.tpl")}"
  vars {
    bastion_public_ip = "${module.bastion.bastion_ip_address}"
  }
}

//  Create the config file used for openshoft installation
resource "local_file" "ose_nodes_config_file" {
  content     = "${data.template_file.ose_nodes_config.rendered}"
  filename = "${path.cwd}/scripts/update_nodes.sh"
}