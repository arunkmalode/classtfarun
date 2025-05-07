#
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"  # Update to a valid VM SKU with >=2 cores and >=4GB RAM
  }