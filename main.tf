// Create the AppServiceplan for the App
module "appserviceplan" {
  source = "./modules/appserviceplan"
  name = var.subnet_name_prefix
  location = var.vnet_name
  resource_group_name = var.resource_group_name
  os_type = var.private_subnet_address_prefixes
  sku = var.public_subnet_address_prefixes
}


// Create the funcapp
module "linuxfuncapp" {
  source = "./modules/linuxfuncapp"
  security_group_name_prefix = var.workspace_name
  location = var.location
  resource_group_name = var.resource_group_name
  private_subnet_id = var.private_subnet_id
  public_subnet_id = var.public_subnet_id
  public_subnet_network_security_group_association_id = var.public_subnet_network_security_group_association_id
  private_subnet_network_security_group_association_id = var.private_subnet_network_security_group_association_id
  depends_on = [module.subnets]
}


// Create the logicapp
module "logicapp" {
  source = "./modules/logicapp"
  security_group_name_prefix = var.workspace_name
  location = var.location
  resource_group_name = var.resource_group_name
  private_subnet_id = var.private_subnet_id
  public_subnet_id = var.public_subnet_id
  public_subnet_network_security_group_association_id = var.public_subnet_network_security_group_association_id
  private_subnet_network_security_group_association_id = var.private_subnet_network_security_group_association_id
  depends_on = [module.subnets]
}


// Create the webapp
module "webapp" {
  source = "./modules/webapp"
  security_group_name_prefix = var.workspace_name
  location = var.location
  resource_group_name = var.resource_group_name
  private_subnet_id = var.private_subnet_id
  public_subnet_id = var.public_subnet_id
  public_subnet_network_security_group_association_id = var.public_subnet_network_security_group_association_id
  private_subnet_network_security_group_association_id = var.private_subnet_network_security_group_association_id
  depends_on = [module.subnets]
}
