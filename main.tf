
resource "terraform_data" "playbook_variables" {
  input = sha256(var.playbook_variables)
}

resource "terraform_data" "inventory" {
  input = sha256(file(var.inventory_path))
}

resource "terraform_data" "ansible_provisioning" {

  lifecycle {
    replace_triggered_by = [terraform_data.playbook_variables]
  }

  provisioner "local-exec" {
    command = <<EOT
      %{for ssh_key in var.ssh_agent_keys}
        ssh-add - <<< "${ssh_key}"
      %{endfor}
    EOT
  }

  provisioner "local-exec" {
    environment = var.playbook_environment_vars
    command = format("ansible-playbook -i %s -u %s %s --extra-vars '%s' %s",
      var.inventory_path,
      var.playbook_ansible_user,
      "%{if var.playbook_ssh_key != ""}--private-key ${var.playbook_ssh_key}%{else}%{endif}",
      jsonencode(yamldecode(var.playbook_variables)),
      var.playbook_path
    )
  }

  provisioner "local-exec" {
    command = <<EOT
        ssh-add -D
    EOT
  }

}
