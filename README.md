# Terraform Kubernetes on Proxmox

This Terraform project is an adaptation designed to create virtual machines (VMs) in Proxmox specifically for Kubernetes clusters. It is based on the Terraform videos by Jim's Garage but addresses potential issues with cloud-init configuration and enhances flexibility.

**Features:**

- Master and Worker Nodes: Provisions the necessary VMs for both master and worker roles within your Kubernetes cluster.
- Multi-Node or Single-Node:  Supports deployments on multiple Proxmox nodes for load balancing or on a single node.
- Explicit Cloud-init:  Declares cloud-init configuration explicitly, ensuring reliable VM provisioning.
- Customizable: Configuration through a `example.auto.tfvars` file allows you to tailor VM specifications, networking, and other settings.

## Important Notes

- Based on Jim's Garage: This project is an adaptation of the Terraform scripts showcased in  [Jim's Garage Terraform video](https://www.youtube.com/watch?v=ZGWn6xREdDE). It is highly recommended to watch his video for context and understanding. 
- Template Cloning: Before using this project, ensure that the specified VM template (e.g., `ubuntu-cloud`) is cloned to each Proxmox node you plan to deploy on.
- Manual Migration: Currently, Terraform's Proxmox provider doesn't support VM migration between nodes. Any migrations will need to be done manually, or if you know how to fix it please let me know.
- Configuration: The `example.auto.tfvars` file includes examples and documentation for each configuration option. You should primarily modify this file and the provider files in the root module and `modules/kubernetes-nodes` directory to suit your environment. 
- As of 25/09/2024, we must use release candidate 4 of the Proxmox provider and compile it ourselves. See [Jim's video](https://www.youtube.com/watch?v=ZGWn6xREdDE&t=1104s) about how to compile it ourselves and use it.

## Prerequisites

1. Terraform: Install Terraform.
2. Proxmox: Have a functional Proxmox cluster.
3. VM Template: Clone the required VM template to each Proxmox node.
4. Proxmox API Token: Generate an API token with necessary permissions. [Jim's video](https://www.youtube.com/watch?v=ZGWn6xREdDE) shows us how to set that up.

## How to Use

1. Clone the Repository:
```bash
   git clone https://github.com/Shoofio/Proxmox-Kuberenetes-Terraform-Deployment-for-Homelab.git
   cd Proxmox-Kuberenetes-Terraform-Deployment-for-Homelab
```

2. Configuration:
   - example.auto.tfvars:  Fill in the required values in `example.auto.tfvars`, referring to the examples and documentation provided within the file.
   - Provider Files: Update the provider configurations in the root module and `modules/kubernetes-nodes` directory with the provider we compiled and version. Notice that there are 2 providers.tf files. One for the root module and one for the kubernetes-nodes module. Refer to [Jim's video](https://www.youtube.com/watch?v=ZGWn6xREdDE) on how to do that.

3. Terraform Execution:
```bash
   terraform init 
   terraform plan 
   terraform apply 
```

## Next Steps

Once your VMs are provisioned, you're ready to set up Kubernetes. You have a few options:

- Jim's Ansible Playbook: Utilize the [Ansible playbook provided by Jim's Garage](https://github.com/JamesTurland/JimsGarage/tree/main/Ansible/Playbooks/RKE2) to automate the Kubernetes deployment process. For more information, reference [Jim's Garage Ansible video](https://www.youtube.com/watch?v=AnYmetq_Ekc).
- Jim's Bash Script:  Use [Jim's Garage Bash Script](https://github.com/JamesTurland/JimsGarage/tree/main/Kubernetes/K3S-Deploy) to automatically configure Kubernetes using K3S on your newly created VMs. For more information, reference [Jim's Garage K3S Script video](https://www.youtube.com/watch?v=6k8BABDXeZI).
- Manual Setup:  Set it up however you like!

## Additional Resources

- Jim's Garage Videos: https://www.youtube.com/@Jims-Garage
- Terraform Documentation: https://www.terraform.io/docs
- Proxmox Documentation: https://pve.proxmox.com/pve-docs/ 