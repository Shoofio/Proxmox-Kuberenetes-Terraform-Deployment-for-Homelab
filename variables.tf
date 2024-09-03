#PROVIDERS

variable "proxmox-api-url" {
  description = "Proxmox API URL"
  type        = string
}

variable "proxmox-api-token-secret" {
  description = "Proxmox API token secret"
  type        = string
}

variable "proxmox-api-token-id" {
  description = "Proxmox API token ID"
  type        = string
}

#PROXMOX NODES

variable "proxmox-nodes" {
  description = "Nodes on Proxmox to deploy the Kubernetes cluster to"
  type        = list(string)
}

variable "main-machine-name" {
  description = "Name of the main machine"
  type        = string
}

variable "is-main-only-master" {
  description = "Put the VM on the main node"
  type        = bool
}

variable "is-main-only-worker" {
  description = "Put the VM on the main node"
  type        = bool
}

variable "is-main-only-storage" {
  description = "Put the VM on the main node"
  type        = bool
}

#GENERAL

variable "template-name" {
  description = "Name of the template to clone from"
  type        = string
}

variable "boot-on-create" {
  description = "Boot the machine after creation"
  type        = bool
}

variable "vm-id-prefix-master" {
  description = "Prefix for the VM IDs"
  type        = string
}

variable "vm-id-prefix-worker" {
  description = "Prefix for the VM IDs"
  type        = string
}

variable "vm-id-prefix-storage" {
  description = "Prefix for the VM IDs"
  type        = string
}

variable "vm-name-master" {
  description = "Name of the VM"
  type        = string
}

variable "vm-name-worker" {
  description = "Name of the VM"
  type        = string
}

variable "vm-name-storage" {
  description = "Name of the VM"
  type        = string
}

#HARDWARE

variable "cores-master" {
  description = "Number of cores for the VM"
  type        = number
}

variable "cores-worker" {
  description = "Number of cores for the VM"
  type        = number
}

variable "cores-storage" {
  description = "Number of cores for the VM"
  type        = number
}

variable "sockets" {
  description = "Number of sockets for the VM"
  type        = number
}

variable "memory-master" {
  description = "Memory for the VM"
  type        = number
}

variable "memory-worker" {
  description = "Memory for the VM"
  type        = number
}

variable "memory-storage" {
  description = "Memory for the VM"
  type        = number
}

variable "cpu-type" {
  description = "CPU type for the VM"
  type        = string
}

#STORAGE

variable "storage-name" {
  description = "Name of the storage"
  type        = string
}

variable "storage-size-master" {
  description = "Size of the storage"
  type        = string
}

variable "storage-size-worker" {
  description = "Size of the storage"
  type        = string
}

variable "storage-size-storage" {
  description = "Size of the storage"
  type        = string
}

#CLOUD INIT

variable "ssh-key" {
  description = "SSH keys to add to the VM"
  type        = string
}

variable "default-gateway" {
  description = "Default gateway for the VM"
  type        = string
}

variable "ip-address-prefix-master" {
  description = "IP address prefix for the VM, a number will be added to the end of the last octet (192.168.1.10 will be 192.168.1.101, the 1 is the count.index)"
  type        = string
}

variable "ip-address-prefix-worker" {
  description = "IP address prefix for the VM, a number will be added to the end of the last octet (192.168.1.10 will be 192.168.1.101, the 1 is the count.index)"
  type        = string
}

variable "ip-address-prefix-storage" {
  description = "IP address prefix for the VM, a number will be added to the end of the last octet (192.168.1.10 will be 192.168.1.101, the 1 is the count.index)"
  type        = string
}

variable "cloud-init-user" {
  description = "User to create on the VM"
  type        = string
}

