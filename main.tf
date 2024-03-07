#Create a custom service account that will be attached to the vm. Default service account contains basic roles- Editor/Owner/Viewer

#a service account with name storage-access will be created in gcp
resource google_service_account vmserviceaccount {
    account_id="storage-access"
    display_name="storage-access"
}

#attaching storage permissions to the service account
resource google_project_iam_member attachstorageperm {
    role="roles/storage.admin"
    member="serviceAccount:${google_service_account.vmserviceaccount.email}"
    project=var.project
}


#Deploying vm with custom service account attached
resource google_compute_instance securevm{
    name="my-first-vm"
    machine_type=var.machinetype
    zone=var.zone
    
    network_interface {
        network="default"
    }
    boot_disk {
        initialize_params {
          image="debian-cloud/debian-11"
        }
    }

    service_account {
      email=google_service_account.vmserviceaccount.email
      scopes=[]
    }
}


