provider "proxmox" {
    # Reference the 'variables.tf' file to read in the values.
    pm_api_url = var.pve_url
    pm_api_token_id = var.pve_api_token
    pm_api_token_secret = var.pve_api_secret
    # Unless using a valid SSL certificate, leave 'pm_tls_insecure = true'.
    pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "test-vm01" {
    # Name the new VM, define general hardware configuration. 
    name = "test-vm01"
    target_node = var.pve_node
    clone = var.pve_template
    agent = 1
    vm_state = "stopped"
    os_type = "cloud-init"
    cores = 2
    sockets = 1
    cpu = "host"
    memory = 2048
    scsihw = "virtio-scsi-pci"
    boot = "order=scsi0;ide2"
    bootdisk = "scsi0"
    cloudinit_cdrom_storage = "local-lvm"
    disks {
        scsi {
            scsi0 {
                disk {
                    backup = false
                    size = 32
                    storage = "local-lvm"                    
                }
            }
        }
    }
    network {
        model = "virtio"
        bridge = "vmbr0"
    }
    # Define the Cloud-Init settings for IP addressing and default user. 
    ciuser = "linuxuser"
    cipassword = "change_me_123!"
    ipconfig0 = "ip=10.0.10.99/24,gw=10.0.10.1"
    nameserver = "10.0.10.1"
    searchdomain = "testlan.local"
}
