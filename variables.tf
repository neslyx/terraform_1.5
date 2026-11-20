variable "region"{
    type = string
    description = "AWS region to deploy resources"
    default = "eu-north-1"
}

variable "project_name" {
    type = string
    description = "Name of the project"
    default = "trainee-project"
}

variable "instance_configs" {
    type = map(string)
    default = {
        "backend" = "t3.micro"
        "frontend" = "t3.small"
    }
}

variable "env" {
    type = string
    description = "Environment name"
}
