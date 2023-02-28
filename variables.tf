# CCE

variable "cluster_version" {
  type    = string
  default = "v1.23"
}

variable "container_network_cidr" {
  type    = string
  default = "172.16.0.0/16"
}

variable "container_network_type" {
  type    = string
  default = "vpc-router"
}

variable "flavor_id" {
  type    = string
  default = "cce.s1.small"
}

variable "name" {
  type = string
}

variable "region" {
  type = string
}

variable "region" {
  type = string
}

variable "service_network_cidr" {
  type    = string
  default = "10.247.0.0/20"
}

variable "subnet_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "availability_zone_cluster" {
  type = string
}

variable "availability_zone_nodegroup" {
  type = string
}

variable "node_group_flavor_id" {
  type    = string
  default = "c6s.xlarge.2"
}

variable "node_root_password" {
  type = string
}

variable "node_group_name" {
  type = string
}

variable "os_nodes" {
  type    = string
  default = "EulerOS 2.9"
}
