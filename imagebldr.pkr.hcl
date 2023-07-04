source "googlecompute" "cosmos-airbyte-image" {
  project_id   = "${var.project}"
  source_image = "${var.source_image_name}"
  ssh_username = "${var.ssh_username}"
  zone         = "${var.zone}"
  image_name   = "${var.vm_image_name}"
  #account_file = "${var.account_key}"
}
build {
  sources = ["sources.googlecompute.cosmos-airbyte-image"]
  provisioner "file" {
    destination = "/home/sparkar/"
    source      = "./airbyte"
  }

  provisioner "file" {
    destination = "/home/sparkar/"
    source      = "./observability"
  }

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common unzip",
      "curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add --",
      "sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable'",
      "sudo apt-get update",
      "sudo apt-get install -y docker-ce docker-ce-cli containerd.io",
      "sudo usermod -a -G docker $USER",
      "sudo apt-get -y install wget",
      "sudo wget https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-$(uname -s)-$(uname -m) -O /usr/local/bin/docker-compose",
      "sudo chmod +x /usr/local/bin/docker-compose",
      "docker-compose --version",
      "sudo cp /home/sparkar/observability/telemetry/docker/daemon.json /etc/docker/daemon.json",
      "sudo service docker restart",
      "systemctl is-active docker",
      "sudo apt-get install git -y"
    ]
  }
}