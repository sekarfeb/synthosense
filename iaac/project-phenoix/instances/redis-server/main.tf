resource "google_compute_instance" "redis_instance" {
  name         = "redis-instance"
  machine_type = "e2-micro"  # Choose an appropriate machine type
  zone         = "europe-west1-b"
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 1024  # Size in GB, 1024 GB = 1 TB
    }
  }

  metadata_startup_script = file("${path.module}/startup-script.sh")

  network_interface {
    network = "default"
    access_config {
      // Include this block to give the VM an external IP
    }
  }

  labels = {
    environment = "production"
    team        = "backend"
    project     = "my-project"
  }

  tags = ["redis"]  # Optional: Add tags for firewall rules or other purposes
}

output "redis_instance_id" {
  value = google_compute_instance.redis_instance.id
}

output "redis_instance_host" {
  value = google_compute_instance.redis_instance.network_interface[0].network_ip
}

output "redis_instance_port" {
  value = 6379  # Default Redis port
}

output "redis_instance_labels" {
  value = google_compute_instance.redis_instance.labels
}
