resource "proxmox_vm_qemu" "cloudinit-k3s-storage" {
  count       = var.is-main-only ? 3 : length(var.proxmox-nodes)
  target_node = var.is-main-only ? var.main-machine-name : var.proxmox-nodes[count.index]
  desc        = "Cloud init storage node for k3s cluster"
  onboot      = var.boot-on-create
  vmid        = "${var.vm-id-prefix}${count.index + 1}"
  clone       = var.template-name
  os_type     = "cloud-init"
  cores       = var.cores
  sockets     = var.sockets
  cpu         = var.cpu-type
  memory      = var.memory
  name        = "${var.vm-name}${count.index + 1}"

  scsihw   = "virtio-scsi-single"
  bootdisk = "scsi0"

  serial {
    id   = 0
    type = "socket"
  }
  
  disks {
    ide {
      ide2 {
        cloudinit {
          storage = var.storage-name
        }
      }
    }

    scsi {
      scsi0 {
        disk {
          storage = var.storage-name
          size    = var.storage-size
        }
      }
    }
  }

  # Setup the ip address using cloud-init.
  # Keep in mind to use the CIDR notation for the ip.
  # ipconfig0 = "ip=dhcp" # We can uncomment this to set it up with dhcp
  ipconfig0 = "ip=${var.ip-address-prefix}${count.index + 1}/24,gw=${var.default-gateway}"
  ciuser    = var.cloud-init-user
  sshkeys   = <<EOF
${var.ssh-key}
    EOF
}
