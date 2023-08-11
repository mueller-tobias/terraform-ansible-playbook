# terraform-ansible-playbook

A terraform module to run a playbook from within terraform.

[![tflint](https://github.com/mueller-tobias/terraform-ansible-playbook/workflows/tflint/badge.svg?branch=master&event=push)](https://github.com/mueller-tobias/terraform-ansible-playbook/actions?query=workflow%3Atflint+event%3Apush+branch%3Amaster)
[![tfsec](https://github.com/mueller-tobias/terraform-ansible-playbook/workflows/tfsec/badge.svg?branch=master&event=push)](https://github.com/mueller-tobias/terraform-ansible-playbook/actions?query=workflow%3Atfsec+event%3Apush+branch%3Amaster)
[![yamllint](https://github.com/mueller-tobias/terraform-ansible-playbook/workflows/yamllint/badge.svg?branch=master&event=push)](https://github.com/mueller-tobias/terraform-ansible-playbook/actions?query=workflow%3Ayamllint+event%3Apush+branch%3Amaster)
[![misspell](https://github.com/mueller-tobias/terraform-ansible-playbook/workflows/misspell/badge.svg?branch=master&event=push)](https://github.com/mueller-tobias/terraform-ansible-playbook/actions?query=workflow%3Amisspell+event%3Apush+branch%3Amaster)
[![pre-commit-check](https://github.com/mueller-tobias/terraform-ansible-playbook/workflows/pre-commit-check/badge.svg?branch=master&event=push)](https://github.com/mueller-tobias/terraform-ansible-playbook/actions?query=workflow%3Apre-commit-check+event%3Apush+branch%3Amaster)
[![semantic-release](https://github.com/mueller-tobias/terraform-ansible-playbook/actions/workflows/semantic-release.yaml/badge.svg)](https://github.com/mueller-tobias/terraform-ansible-playbook/actions/workflows/semantic-release.yaml)
![GitHub release (with filter)](https://img.shields.io/github/v/release/mueller-tobias/terraform-ansible-playbook)

## Example
Here's what using the module will look like
```hcl
module "playbook" {
  source  = "mueller-tobias/playbook/ansible"
  version = "1.0.1"
  # insert the 3 required variables here
}
```

## About

This module can be used to execute a ansible playbook from within terraform.
A change of contents of the inventory or the playbook variables will recreate the ansible resource and trigger a re-run of the playbook.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [terraform_data.ansible_provisioning](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [terraform_data.playbook_variables](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_inventory_path"></a> [inventory\_path](#input\_inventory\_path) | Valid Ansible Inventory File | `string` | n/a | yes |
| <a name="input_playbook_ansible_user"></a> [playbook\_ansible\_user](#input\_playbook\_ansible\_user) | User that will be connect ot the remote machine | `string` | `"ansible"` | no |
| <a name="input_playbook_environment_vars"></a> [playbook\_environment\_vars](#input\_playbook\_environment\_vars) | Ansible Environment Variables | `map(string)` | <pre>{<br>  "ANSIBLE_HOST_KEY_CHECKING": "false"<br>}</pre> | no |
| <a name="input_playbook_path"></a> [playbook\_path](#input\_playbook\_path) | Path tot the Playbook that should be executed | `string` | n/a | yes |
| <a name="input_playbook_ssh_key"></a> [playbook\_ssh\_key](#input\_playbook\_ssh\_key) | SSH Key that will be used to connect with the remote machines | `string` | `""` | no |
| <a name="input_playbook_variables"></a> [playbook\_variables](#input\_playbook\_variables) | Playbook Variables in YAML Format | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
