variable "playbook_variables" {
  type        = string
  description = "Playbook Variables in YAML Format"

  validation {
    condition     = can(yamldecode(var.playbook_variables))
    error_message = "The playbook variables must containt valid yaml code"
  }
}

variable "playbook_environment_vars" {
  type        = map(string)
  description = "Ansible Environment Variables"
  default = {
    "ANSIBLE_HOST_KEY_CHECKING" = "false"
  }
}

variable "inventory_path" {
  type        = string
  description = "Valid Ansible Inventory File"
}

variable "playbook_ansible_user" {
  type        = string
  description = "User that will be connect ot the remote machine"
  default     = "ansible"
}

variable "playbook_ssh_key" {
  type        = string
  description = "SSH Key that will be used to connect with the remote machines"
  default     = ""
}

variable "playbook_path" {
  type        = string
  description = "Path tot the Playbook that should be executed"

  validation {
    condition     = can(yamldecode(file(var.playbook_path)))
    error_message = "The playbook must exist and contain valid YAML Code"
  }
}
