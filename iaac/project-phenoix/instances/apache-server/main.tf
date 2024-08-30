resource "google_compute_instance" "apache_server" {
  name         = "apache-server"
  machine_type = "e2-medium"
  zone         = "europe-west1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 40  # Size in GB, 1024 GB = 1 TB
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = <<-EOF
    sudo apt-get update
    sudo apt-get install -y apache2
    sudo systemctl start apache2
    sudo systemctl enable apache2
  EOF
}

output "instance_ip" {
  value = google_compute_instance.apache_server.network_interface[0].access_config[0].nat_ip
}
