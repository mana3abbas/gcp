resource "google_compute_instance" "bastion" {
  name         = "bastion-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  tags = ["bastion-vm"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network    = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.Management_Subnet.name
  }

  labels = {
    "name" = "private-vm"
  }
}
