# Define the Terraform provider to use, including the specific version.
terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
}
