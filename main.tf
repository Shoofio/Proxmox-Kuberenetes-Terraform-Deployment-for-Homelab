module "master" {
  source = "./modules/kubernetes-nodes"
  # Proxmox Nodes
  proxmox-nodes              = var.proxmox-nodes-master
  main-machine-name          = var.main-machine-name-master
  is-main-only               = var.is-main-only-master
  number-of-kubernetes-nodes = var.number-of-kubernetes-nodes-master
  # General
  template-name  = var.template-name-master
  boot-on-create = var.boot-on-create-master
  vm-id-prefix   = var.vm-id-prefix-master
  vm-name        = var.vm-name-prefix-master
  # Hardware
  cores    = var.cores-master
  sockets  = var.sockets-master
  memory   = var.memory-master
  cpu-type = var.cpu-type-master
  # Storage
  storage-name = var.storage-name-master
  storage-size = var.storage-size-master
  # Network
  ssh-key           = var.ssh-key-master
  default-gateway   = var.default-gateway-master
  ip-address-prefix = var.ip-address-prefix-master
  cloud-init-user   = var.cloud-init-user-master
}

module "worker" {
  source = "./modules/kubernetes-nodes"
  # Proxmox Nodes
  proxmox-nodes              = var.proxmox-nodes-worker
  main-machine-name          = var.main-machine-name-worker
  is-main-only               = var.is-main-only-worker
  number-of-kubernetes-nodes = var.number-of-kubernetes-nodes-worker
  # General
  template-name  = var.template-name-worker
  boot-on-create = var.boot-on-create-worker
  vm-id-prefix   = var.vm-id-prefix-worker
  vm-name        = var.vm-name-prefix-worker
  # Hardware
  cores    = var.cores-worker
  sockets  = var.sockets-worker
  memory   = var.memory-worker
  cpu-type = var.cpu-type-worker
  # Storage
  storage-name = var.storage-name-worker
  storage-size = var.storage-size-worker
  # Network
  ssh-key           = var.ssh-key-worker
  default-gateway   = var.default-gateway-worker
  ip-address-prefix = var.ip-address-prefix-worker
  cloud-init-user   = var.cloud-init-user-worker
}
