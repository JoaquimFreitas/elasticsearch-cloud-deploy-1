# TODO pull via a prefix query
# https://github.com/terraform-providers/terraform-provider-azurerm/issues/577

data "azurerm_image" "elasticsearch" {
  name                = "elasticsearch5-2018-02-11T105507"
  resource_group_name = "custom-images"
}

data "azurerm_image" "kibana" {
  name                = "kibana5-2018-02-15T111136"
  resource_group_name = "custom-images"
}
