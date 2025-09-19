# Generic Variables
# Business Division
variable "business_division" {
  description = "Business division in organisation this infrastructure belongs to"
  type        = string
  default = "sap"
}

# Environment Variables
variable "environment" {
    description = "Environment this infrastructure belongs to (e.g. dev, prod, etc.) - used as prefix"
    type        = string
    default     = "dev"
}

variable "resource_group_name" {
  description = "name of the resource group"
  default = "rg-default"
}

variable "resource_group_location" {
  description = "Region for creating Azure reosurces"
  default = "East US"
}
