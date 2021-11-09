# Define the elastic beanstalk configuration here.

resource "aws_elastic_beanstalk_application" "gallery" {
  name        = "gallery-test-app-${var.gallery_info.env_name}"
  description = "Gallery test application"
}
resource "aws_elastic_beanstalk_environment" "tfenvtest" {
  name                = "tf-test-name-${var.gallery_info.env_name}"
  application         = aws_elastic_beanstalk_application.gallery.name
  solution_stack_name = "64bit Amazon Linux 2 v3.3.7 running Python 3.8"
  setting {
      namespace = "aws:autoscaling:launchconfiguration"
      name = "IamInstanceProfile"
      value = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "InstanceType"
    value = "t2.micro"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name = "EnvironmentType"
    value = "LoadBalanced"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name = "LoadBalancerType"
    value = "application"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name = "MinSize"
    value = 1
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name = "MaxSize"
    value = 1
  }
}
