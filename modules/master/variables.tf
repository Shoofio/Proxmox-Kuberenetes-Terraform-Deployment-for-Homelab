#PROXMOX NODES

variable "proxmox-nodes" {
  description = "Nodes on Proxmox to deploy the Kubernetes cluster to"
  type        = list(string)
}

variable "main-machine-name" {
  description = "Name of the main machine"
  type        = string
}

variable "is-main-only" {
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

variable "vm-id-prefix" {
  description = "Prefix for the VM IDs"
  type        = string
}

variable "vm-name" {
  description = "Name of the VM"
  type        = string
}

#HARDWARE

variable "cores" {
  description = "Number of cores for the VM"
  type        = number
}

variable "sockets" {
  description = "Number of sockets for the VM"
  type        = number
}

variable "memory" {
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

variable "storage-size" {
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

variable "ip-address-prefix" {
  description = "IP address prefix for the VM, a number will be added to the end of the last octet (192.168.1.10 will be 192.168.1.101, the 1 is the count.index)"
  type        = string
}

variable "cloud-init-user" {
  description = "User to create on the VM"
  type        = string
}

