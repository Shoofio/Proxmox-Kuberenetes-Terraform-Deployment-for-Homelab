# @@@@@@ IMPORTANT!! @@@@@@ #
# Never upload your .tfvars file to your Git repo, especially if they have sensitive information such as the API Token Secret! 
# You can use a .tfvars.example file to show the structure of the .tfvars file, and then use a .gitignore file to ignore the .tfvars file.
# This is to prevent sensitive information from being uploaded to your Git repo.
# The provided values are examples, you may change them as you like or need. I tried to make it as understandable and realistic as possible.
# This script is based off of the Terraform video in Jim's Garage, please use it as reference, even though the script is quite different.
# I tried to emulate it as much as I could so that you could start the next stage, which is deploying Kubernetes either through Ansible or through his script.
# https://www.youtube.com/@Jims-Garage

###### PROVIDERS ######

proxmox-api-url          = "https://192.168.1.6:8006/api2/json" # Proxmox API URL on your main Proxmox node (The one that made the cluster)
proxmox-api-token-id     = "root@pam!terraform"                 # Proxmox API Token ID, found in Datacenter > Permissions > API Tokens
proxmox-api-token-secret = "YOUR_API_TOKEN_SECRET_HERE"         # Proxmox API Token secret, this is related to the Proxmox API Token

###### MASTER NODES ######

# PROXMOX NODES

proxmox-nodes-master              = ["pve1", "pve2", "pve3"] # Each Proxmox node you plan to put your VMs on. Make sure to put your strongest nodes first, because it will round robin. (pve1, pve2, pve3, pve1, pve2, ...)
main-machine-name-master          = "pve0"                   # Only need this if you have one Proxmox node. You can leave this empty if you plan on doing more than one node.
is-main-only-master               = false                    # Set to true if you only have one Proxmox node. It'll put all of the VMs on that machine.
number-of-kubernetes-nodes-master = 3                        # Number of Kubernetes nodes to create. Master nodes need at least 3 for High Availabilty. If the number of Kubernetes nodes is bigger than the number of Proxmox nodes, it'll round robin. (pve1, pve2, pve3, pve1, pve2, ...)

# GENERAL

template-name-master  = "ubuntu-cloud" # VM template to clone from, this must already be on each node you plan to run this on!
boot-on-create-master = true           # Set to true if you want the VM to start on creation.
vm-id-prefix-master   = "70"           # VM ID prefix, this is used to identify the VM in Proxmox. This is the prefix, numbers will be added to it, e.g. 701, 702, etc.
vm-name-prefix-master = "k8s-master-"  # VM name prefix, this is used to identify the VM in Proxmox. This is the prefix, numbers will be added to it, e.g. k8s-master-1, k8s-master-2, etc.

# HARDWARE

cores-master    = 4      # Number of cores to allocate to the VM.
sockets-master  = 1      # Number of sockets to allocate to the VM.
memory-master   = 4096   # Memory to allocate to the VM in MB.
cpu-type-master = "host" # CPU type to allocate to the VM. Should probably keep this as is.

# STORAGE

storage-name-master = "local-lvm" # Storage to use for the VM. Usually called local-lvm. Please double check.
storage-size-master = 32          # Size of the storage to allocate to the VM in GB.

# CLOUD INIT

ssh-key-master           = "YOUR_PUBLIC_KEY_HERE" # SSH public key to use for the VM. See Jim's guide on how to generate this.
default-gateway-master   = "192.168.1.1"          # Your network's default gateway, usually the IP address of your router.
ip-address-prefix-master = "192.168.1.12"         # IP address prefix to use for the VM. This is the prefix, numbers will be added to it, e.g. 192.168.1.121, 192.168.1.122, etc. Notice that if tere are more than 10 VMs, the last number will be 2 digits and it can overflow (1210), rendering the ip invalid, so plan accordingly.
cloud-init-user-master   = "ubuntu"               # User to create on the VM.

###### WORKER NODES ######

# PROXMOX NODES

proxmox-nodes-worker              = ["pve1", "pve2", "pve3"] # Each Proxmox node you plan to put your VMs on. Make sure to put your strongest nodes first, because it will round robin. (pve1, pve2, pve3, pve1, pve2, ...)
main-machine-name-worker          = "pve0"                   # Only need this if you have one Proxmox node. You can leave this empty if you plan on doing more than one node.
is-main-only-worker               = false                    # Set to true if you only have one Proxmox node. It'll put all of the VMs on that machine.
number-of-kubernetes-nodes-worker = 3                        # Number of Kubernetes nodes to create. If the number of Kubernetes nodes is bigger than the number of Proxmox nodes, it'll round robin. (pve1, pve2, pve3, pve1, pve2, ...)

# GENERAL

template-name-worker  = "ubuntu-cloud" # VM template to clone from, this must already be on each node you plan to run this on!
boot-on-create-worker = true           # Set to true if you want the VM to start on creation.
vm-id-prefix-worker   = "80"           # VM ID prefix, this is used to identify the VM in Proxmox. This is the prefix, numbers will be added to it, e.g. 801, 802, etc.
vm-name-prefix-worker = "k8s-worker-"  # VM name prefix, this is used to identify the VM in Proxmox. This is the prefix, numbers will be added to it, e.g. k8s-master-1, k8s-master-2, etc.

# HARDWARE

cores-worker    = 6      # Number of cores to allocate to the VM.
sockets-worker  = 1      # Number of sockets to allocate to the VM.
memory-worker   = 8192   # Memory to allocate to the VM in MB.
cpu-type-worker = "host" # CPU type to allocate to the VM. Should probably keep this as is.

# STORAGE

storage-name-worker = "local-lvm" # Storage to use for the VM. Usually called local-lvm. Please double check.
storage-size-worker = 64          # Size of the storage to allocate to the VM in GB.

# CLOUD INIT

ssh-key-worker           = "YOUR_PUBLIC_KEY_HERE" # SSH public key to use for the VM. See Jim's guide on how to generate this.
default-gateway-worker   = "192.168.1.1"          # Your network's default gateway, usually the IP address of your router.
ip-address-prefix-worker = "192.168.1.13"         # IP address prefix to use for the VM. This is the prefix, numbers will be added to it, e.g. 192.168.1.131, 192.168.1.132, etc. Notice that if tere are more than 10 VMs, the last number will be 2 digits and it can overflow (1310), rendering the IP invalid, so plan accordingly.
cloud-init-user-worker   = "ubuntu"               # User to create on the VM.
