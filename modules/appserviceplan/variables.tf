variable "name" {
  type        = string
  description = "App Service Plan Name"
}

variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "os_type" {
  type        = string
  description = "windows/linux"
}


variable "sku" {
  type        = string
  description = "B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, WS3, and Y1
Elastic and Consumption SKUs (Y1, EP1, EP2, and EP3) are for use with Function Apps.
Isolated SKUs (I1, I2, I3, I1v2, I2v2, and I3v2) can only be used with App Service Environments"
}

variable "app_service_environmnet_id" {
  type        = string
  description = "aseID"
}