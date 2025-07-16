provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "ha-datacenter"
}

data "vsphere_datastore" "datastore" {
  name          = "IBM_storage_iscsi"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = "iyanu-k8s"
  resource_pool_id = "ha-root-pool"
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus   = 2
  memory     = 4096
  guest_id   = "centos7_64Guest"
  scsi_type  = "lsilogic"

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }

  cdrom {
    datastore_id = data.vsphere_datastore.datastore.id
    path         = " [Boot and iso] rhel-9.2-x86_64-dvd.iso"
  }

  disk {
    label            = "disk0"
    size             = 50
    eagerly_scrub    = false
    thin_provisioned = true
  }

  wait_for_guest_net_timeout = 0
}
