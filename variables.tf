variable "credentials" {
  type = string
  default = null
}
variable "rest_api" {
  type = string
}

variable "resource" {
  type = list
}

variable "http_method" {
  type = list
}

variable "region" {
  type = string
  default =  null
}

variable "lambda_arn" {
  type = list
  default = []
}

variable "request_templates" {
  type = string
  default = null
}
