data "aws_ssm_parameter" "vpc_id" {
  name = "/hacka/eks/vpc_id"
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/hacka/eks/private_subnet_ids"
}

module "api_gateway" {
  source                         = "./modules/api-gateway"
  project_name                   = var.project_name
  authorizer_lambda_name         = "hacka-authorizer-lambda"
  lb_service_name_msc_mgmt_media = "hacka-msc-mgmt-media-service"
  lb_service_port_msc_mgmt_media = 80
  lb_service_name_msc_pcs_midia  = "hacka-msc-pcs-midia-service"
  lb_service_port_msc_pcs_midia  = 89
  vpc_id                         = data.aws_ssm_parameter.vpc_id.value
  private_subnet_ids             = split(",", data.aws_ssm_parameter.private_subnet_ids.value)
}

resource "aws_ssm_parameter" "api_gateway_endpoint" {
  name  = "/hacka/api_gateway/endpoint"
  type  = "String"
  value = module.api_gateway.api_gateway_endpoint
}