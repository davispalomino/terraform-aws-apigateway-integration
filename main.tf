terraform {
  required_version = ">= 0.12.1"
}
resource "aws_api_gateway_integration" "this" {
  count                   = "${length(var.resource)}"
  credentials             = "${var.credentials}"
  rest_api_id             = "${var.rest_api}"
  resource_id             = "${var.resource[count.index]}"
  http_method             = "${var.http_method[count.index]}"
  integration_http_method = "${var.http_method[count.index]}"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.region == null ? "" : var.region}:lambda:path/2015-03-31/functions/${length(var.lambda_arn) == 0 ? "" : (length(var.lambda_arn) == 1 ? var.lambda_arn[0] : var.lambda_arn[count.index])}/invocations"
  request_templates = {
    "application/json" = "${file(var.request_templates)}"
    }
}