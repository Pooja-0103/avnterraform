variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "resource_group_location" {
  type        = string
  description = "RG location in Azure"
}

variable "virtual_network_name" {
  type        = string
  description = "VNET name in Azure"
}

variable "address_space" {
  description = "VNET address space name in Azure"
}
variable "subnet_name" {
  type        = string
  description = "Subnet name in Azure"
}

variable "address_prefixes" {
  description = "Subnet address prefix name in Azure"
}
  variable "public_ip_name" {
  type        = string
  description = "Public IP name in Azure"
}
variable "allocation_method" {
  type        = string
  description = "Public IP name in Azure"
}
variable "ip_configuration_name" {
  type        = string
  description = "Public IP name in Azure"
}

variable "network_security_group_name" {
  type        = string
  description = "NSG name in Azure"
}
variable "network_interface_name" {
  type        = string
  description = "NIC name in Azure"
}
variable "storage_account_name" {
  description = "(Required) Specifies the human consumable label for this resource."
}
variable "storage_account_tier" {
  description = "(Required) Defines the Tier to use for this storage account. Valid options are Standard* and Premium. Changing this forces a new resource to be created"

}
variable "storage_account_replication_type" {
  description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS*, GRS, RAGRS and ZRS."

}
variable "default_action" {
  description = "(Required) Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow"
  
}

variable "virtual_network_subnet_ids" {
  description = "(Required) A list of resource ids for subnets."
}
variable "vmname" {
  description = "vm name"
}
variable "size" {
  description = "vm size"
}
variable "network_interface_ids" {
    
  
}
variable "publisher" {
  description = "publisher name ex : Canonical" 
}

variable "offer" {
  description = "offer name ex : UbuntuServer"  
}

variable "sku" {
  description = "sku name ex : 18.04-LTS" 
}

variable "admin_username" {
    description = "admin_username  ex: azureuser"

}
variable "admin_password" {
    description = "admin_password "
}