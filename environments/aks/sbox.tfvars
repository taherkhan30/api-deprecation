cluster_count                     = 2
kubernetes_cluster_version        = "1.25.5"
kubernetes_cluster_ssh_key        = ""
enable_user_system_nodepool_split = true
project_acr_enabled               = true
workload_identity_enabled         = true
service_operator_settings_enabled = true

enable_automatic_channel_upgrade_patch = true

system_node_pool = {
  vm_size   = "Standard_D4ds_v5",
  min_nodes = 2,
  max_nodes = 4
}
linux_node_pool = {
  vm_size   = "Standard_D4ds_v5",
  min_nodes = 4,
  max_nodes = 10
}

availability_zones = ["1"]
autoShutdown       = true