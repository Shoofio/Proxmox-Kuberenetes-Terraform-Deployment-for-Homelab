resource "proxmox_vm_qemu" "cloudinit-kubernetes-node" {
  count       = var.number-of-kubernetes-nodes # Determine the number of VMs (Kubernetes nodes) to create.
  target_node = var.is-main-only ? var.main-machine-name : var.proxmox-nodes[count.index % length(var.proxmox-nodes)] # Distribute VMs across Proxmox nodes in a round robin manner.
  desc        = "Cloud init node for Kubernetes cluster"
  onboot      = var.boot-on-create # Whether to start the VM on creation.
  vmid        = "${var.vm-id-prefix}${count.index + 1}" # VM ID, e.g. 101, 102, etc.
  clone       = var.template-name # Name of the template to clone the node from. This must be already set up in each Proxmox node.
  os_type     = "cloud-init" # This is needed to use clout-init.
  cores       = var.cores
  sockets     = var.sockets
  cpu         = var.cpu-type 
  memory      = var.memory
  name        = "${var.vm-name}${count.index + 1}" # Name of the VM, e.g. master1, worker1, etc.

  scsihw   = "virtio-scsi-single" # This is needed to use cloud-init.
  bootdisk = "scsi0" # This is needed to use cloud-init.

  serial { # This is needed to see the cloud-init logs in the Proxmox web interface.
    id   = 0
    type = "socket"
  }
  
  disks { # This is where we define the disk size and storage for the VM.
    ide { # This is where we define the cloud-init disk.
      ide2 {
        cloudinit {
          storage = var.storage-name
        }
      }
    }

    scsi { # This is where we define the main disk for the VM.
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
  ipconfig0 = "ip=${var.ip-address-prefix}${count.index + 1}/24,gw=${var.default-gateway}" # We can use this to set it up with a static ip, make sure those ips are not already in use.
  ciuser    = var.cloud-init-user # This is the user that will be created by cloud-init.
  # This is the ssh key that will be added to the user.
  sshkeys   = <<EOF
${var.ssh-key}
    EOF
}
