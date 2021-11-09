# Terraform outputs can be used to define Gallery 
# URL mappers and environment mappers.

output "base_url" {
     description = "The URL to the elastic beanstalk instance"
     value = aws_elastic_beanstalk_environment.tfenvtest.cname
}
