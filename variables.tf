# Proxmox host URL or IP string. Make sure to append with "/api/json".
variable "pve_url" {
    type = string
    default = "https://10.0.0.100/api2/json"
}

# Target Proxmox node to make changes to. 
variable "pve_node" {
    type = string
    default = "ts-hvr-pve01"
}

# Proxmox API token to use for authentication. 
variable "pve_api_token" {
    type = string
    default = "terraform@pve!terraformAPI01"
}

# Proxmox API secret to use for authentication. 
variable "pve_api_secret" {
    type = string
    default = "12345-67890"
}

# Proxmox template to use for VM clone. 
variable "pve_template" {
    type = string
    default = "template-ubuntu-2204-cloudinit-2c2gb32g"
}
