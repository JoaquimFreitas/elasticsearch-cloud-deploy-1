variable "azure_location" {
  type    = "string"
  default = "East US"
}

variable "azure_client_id" {
  type    = "string"
  default = "479a3a7e-ce8a-4426-b2ab-fe9889441263"
}

variable "azure_client_secret" {
  type = "string"
}

variable "azure_subscription_id" {
  type    = "string"
  default = "0c7d154b-32f5-42f0-ac69-845a1c9e0c70"
}

variable "azure_tenant_id" {
  type    = "string"
  default = "20b382fd-aa93-4c60-829d-953fb3853002"
}

variable "es_cluster" {
  description = "Name of the elasticsearch cluster, used in node discovery"
  default     = "phydeaux-es-cluster"
}

variable "key_path" {
  description = "Key name to be used with the launched EC2 instances."
  default     = "~/.ssh/admbyronb.pub"
}

variable "environment" {
  default = "default"
}

variable "data_instance_type" {
  type    = "string"
  default = "Standard_DS3_v2"
}

variable "master_instance_type" {
  type    = "string"
  default = "Standard_A2_v2"
}

variable "client_instance_type" {
  type    = "string"
  default = "Standard_A2_v2"
}

variable "elasticsearch_volume_size" {
  type    = "string"
  default = "100"    # gb
}

variable "use_instance_storage" {
  default = "true"
}

variable "associate_public_ip" {
  default = "true"
}

variable "elasticsearch_data_dir" {
  default = "/mnt/elasticsearch/data"
}

variable "elasticsearch_logs_dir" {
  default = "/var/log/elasticsearch"
}

# default elasticsearch heap size
variable "data_heap_size" {
  type    = "string"
  default = "7g"
}

variable "master_heap_size" {
  type    = "string"
  default = "2g"
}

variable "masters_count" {
  default = "3"
}

variable "datas_count" {
  default = "2"
}

variable "clients_count" {
  default = "1"
}

# whether or not to enable x-pack security on the cluster
variable "security_enabled" {
  default = "false"
}

# whether or not to enable x-pack monitoring on the cluster
variable "monitoring_enabled" {
  default = "true"
}

# client nodes have nginx installed on them, these credentials are used for basic auth
variable "client_user" {
  default = "exampleuser"
}
