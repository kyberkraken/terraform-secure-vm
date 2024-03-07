variable "project" {
    description="GCP project id"
    default="sunlit-hook-261813"
}

variable "machinetype" {
    description="machine type for the vm"
    default="e2-medium"
}

variable "zone" {
    description="zone for the deployed vm"
    default="us-central1-a"
}

variable "region" {
    description="region for my gcp account"
    default="us-central1"
}

variable "sa_key_path"{
    description="path to my sa key being used by terraform to create resources"
    default="../sunlit-hook-261813-47cbc7c45ca7.json"
    sensitive=true
}
