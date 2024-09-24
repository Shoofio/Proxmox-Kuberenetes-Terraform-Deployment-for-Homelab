###### PROVIDERS ######

variable "proxmox-api-url" {
  description = "Proxmox API URL on your main Proxmox node"
  type        = string
}

variable "proxmox-api-token-id" {
  description = "Proxmox API Token ID, found in Datacenter > Permissions > API Tokens"
  type        = string
}

variable "proxmox-api-token-secret" {
  description = "Proxmox API Token secret, this is related to the Proxmox API Token"
  type        = string
  sensitive   = true
}

###### MASTER NODES ######

# PROXMOX NODES

variable "proxmox-nodes-master" {
  description = "Each Proxmox node you plan to put your VMs on. Make sure to put your strongest nodes first, because it will round robin. (pve1, pve2, pve3, pve1, pve2, ...)"
  type        = list(string)
}

variable "main-machine-name-master" {
  description = "Only need this if you have one Proxmox node. You can leave this empty if you plan on doing more than one node."
  type        = string
}

variable "is-main-only-master" {
  description = "Set to true if you only have one Proxmox node. It'll put all of the VMs on that machine."
  type        = bool
}

variable "number-of-kubernetes-nodes-master" {
  description = "Number of Kubernetes nodes to create. Master nodes need at least 3 for High Availabilty.  If the number of Kubernetes nodes is bigger than the number of Proxmox nodes, it'll round robin. (pve1, pve2, pve1, pve2, ...)"
  type        = number
}


#GENERAL

variable "template-name-master" {
  description = "VM template to clone from, this must already be on each node you plan to run this on!"
  type        = string
}

variable "boot-on-create-master" {
  description = "Set to true if you want the VM to start on creation."
  type        = bool
}

variable "vm-id-prefix-master" {
  description = "VM ID prefix, this is used to identify the VM in Proxmox. This is the prefix, numbers will be added to it, e.g. 701, 702, etc."
  type        = string
}

variable "vm-name-prefix-master" {
  description = "VM name prefix, this is used to identify the VM in Proxmox. This is the prefix, numbers will be added to it, e.g. k8s-master-1, k8s-master-2, etc."
  type        = string
}

#HARDWARE

variable "cores-master" {
  description = "Number of cores to allocate to the VM."
  type        = number
}

variable "sockets-master" {
  description = "Number of sockets to allocate to the VM."
  type        = number
}

variable "memory-master" {
  description = "Memory to allocate to the VM in MB."
  type        = number
}

variable "cpu-type-master" {
  description = "CPU type to allocate to the VM."
  type        = string
}

#STORAGE

variable "storage-name-master" {
  description = "Storage to use for the VM. Usually called local-lvm. Please double check."
  type        = string
}

variable "storage-size-master" {
  description = "Size of the storage to allocate to the VM in GB."
  type        = string
}

#CLOUD INIT

variable "ssh-key-master" {
  description = "SSH public key to use for the VM. See Jim's guide on how to generate this."
  type        = string
}

variable "default-gateway-master" {
  description = "Your network's default gateway, usually the IP address of your router."
  type        = string
}

variable "ip-address-prefix-master" {
  description = "IP address prefix to use for the VM. This is the prefix, numbers will be added to it, e.g. 192.168.1.121, 192.168.1.122, etc. Notice that if tere are more than 10 VMs, the last number will be 2 digits and it can overflow (1210), rendering the ip invalid, so plan accordingly."
  type        = string
}

variable "cloud-init-user-master" {
  description = "User to create on the VM."
  type        = string
}

###### WORKER NODES ######

# PROXMOX NODES

variable "proxmox-nodes-worker" {
  description = "Each Proxmox node you plan to put your VMs on. Make sure to put your strongest nodes first, because it will round robin. (pve1, pve2, pve3, pve1, pve2, ...)"
  type        = list(string)
}

variable "main-machine-name-worker" {
  description = "Only need this if you have one Proxmox node. You can leave this empty if you plan on doing more than one node."
  type        = string
}

variable "is-main-only-worker" {
  description = "Set to true if you only have one Proxmox node. It'll put all of the VMs on that machine."
  type        = bool
}

variable "number-of-kubernetes-nodes-worker" {
  description = "Number of Kubernetes nodes to create. If the number of Kubernetes nodes is bigger than the number of Proxmox nodes, it'll round robin. (pve1, pve2, pve1, pve2, ...)"
  type        = number
}


#GENERAL

variable "template-name-worker" {
  description = "VM template to clone from, this must already be on each node you plan to run this on!"
  type        = string
}

variable "boot-on-create-worker" {
  description = "Set to true if you want the VM to start on creation."
  type        = bool
}

variable "vm-id-prefix-worker" {
  description = "VM ID prefix, this is used to identify the VM in Proxmox. This is the prefix, numbers will be added to it, e.g. 801, 802, etc."
  type        = string
}

variable "vm-name-prefix-worker" {
  description = "VM name prefix, this is used to identify the VM in Proxmox. This is the prefix, numbers will be added to it, e.g. k8s-worker-1, k8s-worker-2, etc."
  type        = string
}

#HARDWARE

variable "cores-worker" {
  description = "Number of cores to allocate to the VM."
  type        = number
}

variable "sockets-worker" {
  description = "Number of sockets to allocate to the VM."
  type        = number
}

variable "memory-worker" {
  description = "Memory to allocate to the VM in MB."
  type        = number
}

variable "cpu-type-worker" {
  description = "CPU type to allocate to the VM."
  type        = string
}

#STORAGE

variable "storage-name-worker" {
  description = "Storage to use for the VM. Usually called local-lvm. Please double check."
  type        = string
}

variable "storage-size-worker" {
  description = "Size of the storage to allocate to the VM in GB."
  type        = string
}

#CLOUD INIT

variable "ssh-key-worker" {
  description = "SSH public key to use for the VM. See Jim's guide on how to generate this."
  type        = string
}

variable "default-gateway-worker" {
  description = "Your network's default gateway, usually the IP address of your router."
  type        = string
}

variable "ip-address-prefix-worker" {
  description = "IP address prefix to use for the VM. This is the prefix, numbers will be added to it, e.g. 192.168.1.121, 192.168.1.122, etc. Notice that if tere are more than 10 VMs, the last number will be 2 digits and it can overflow (1210), rendering the ip invalid, so plan accordingly."
  type        = string
}

variable "cloud-init-user-worker" {
  description = "User to create on the VM."
  type        = string
}

