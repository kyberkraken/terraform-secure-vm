provider "google" {
    project=var.project
    region=var.region
    credentials=file(var.sa_key_path)
}