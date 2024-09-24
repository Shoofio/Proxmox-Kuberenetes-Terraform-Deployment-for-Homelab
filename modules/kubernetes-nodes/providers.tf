terraform {
  required_version = ">= 0.14"
  required_providers {
    proxmox = {
      source  = "registry.example.com/telmate/proxmox" # This is the source of the provider, in this case we compiled it ourselves and made the "registry" ourselves, due to using a release candidate. Please refer to Jim's video on the subject: https://youtu.be/ZGWn6xREdDE?si=1a56aPkUCZtWZwfE&t=1104
      version = ">= 1.0.0"
    }
  }
}