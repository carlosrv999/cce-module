output "cluster_id" {
  value = huaweicloud_cce_cluster.default.id
}

output "node_pool_id" {
  value = huaweicloud_cce_node_pool.node_pool.id
}
