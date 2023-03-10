resource "huaweicloud_cce_cluster" "default" {
  cluster_version        = var.cluster_version
  container_network_cidr = var.container_network_cidr
  container_network_type = var.container_network_type
  flavor_id              = var.flavor_id
  name                   = var.name
  region                 = var.region
  service_network_cidr   = var.service_network_cidr
  subnet_id              = var.subnet_id
  tags                   = var.tags
  vpc_id                 = var.vpc_id
  eip                    = huaweicloud_vpc_eip.default.address

  masters {
    availability_zone = var.availability_zone_cluster
  }

}

resource "huaweicloud_cce_node_pool" "node_pool" {
  availability_zone  = var.availability_zone_nodegroup
  cluster_id         = huaweicloud_cce_cluster.default.id
  flavor_id          = var.node_group_flavor_id
  initial_node_count = var.initial_node_count
  name               = var.node_group_name
  password           = var.node_root_password
  os                 = var.os_nodes
  region             = var.region
  runtime            = "containerd"
  scall_enable       = false
  type               = "vm"

  data_volumes {
    extend_params  = {}
    hw_passthrough = false
    size           = 100
    volumetype     = "SSD"
  }

  root_volume {
    extend_params  = {}
    hw_passthrough = false
    size           = 50
    volumetype     = "SSD"
  }

}

resource "huaweicloud_vpc_eip" "default" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name        = "cce-module-eip"
    size        = 10
    share_type  = "PER"
    charge_mode = "traffic"
  }
}
