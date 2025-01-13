variable "project_name" {
  description = "The name of the project"
  type = string
}

variable vpc_id {
  description = "VPC ID from which belogs the subnets"
  type        = string
}

variable "private_subnet_ids" {
  type = list(string)
  description = "List of subnet IDs."
}

variable "lb_service_name_msc_mgmt_media" {
  type = string
  description = "Name of the Load Balancer K8s service that exposes the orders microservices (msc-mgmt-media)"
}

variable "lb_service_port_msc_mgmt_media" {
  type = number
  description = "Port exposed of the Load Balancer K8s service associated to the orders microservices (msc-mgmt-media)"
}

variable "lb_service_name_msc_pcs_midia" {
  type = string
  description = "Name of the Load Balancer K8s service that exposes the orders microservices (msc-pcs-midia)"
}

variable "lb_service_port_msc_pcs_midia" {
  type = number
  description = "Port exposed of the Load Balancer K8s service associated to the orders microservices (msc-pcs-midia)"
}

variable "authorizer_lambda_name" {
    type = string
    description = "Name of the Lambda function that will be used as authorizer"
}