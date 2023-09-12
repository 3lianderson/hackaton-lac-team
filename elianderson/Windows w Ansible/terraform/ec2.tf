resource "aws_key_pair" "eli_k8s" {
  key_name   = "eli_k8s"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDc3HnNYlQY5PUi7iR9wZ8Us1qNavyiIqm+2FchtMA1b2q1O6QyseQej510NPq7uYWki3MCtKAoLbBUz/XPGS+JMPg4C5OrYmeofw78SSBPo6W9P9BXmUXG3zE+dWGJDQyrsZIww9Q178bSmUyeK8bqmIauj8sE1k0WjrfQC8a8ih6BC5BPvrpylly1GEvgD+fONLqr8uc+040LixRvIGdQIyZcFvR0Wf0dRE4apY216vFyu4lohPfkkJKUasCOSZ4OUxWesuaW+7iIXxnjr5s8YGBOX48cm9A2iWXJrmtIDslKIAk7NUkZ1FukFyrqMUNp+yvTrcr3gzAIOOdLvZA5"
}

resource "aws_security_group" "k8s-sg" {

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5986
    to_port     = 5986
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "kubernetes-worker" {
  ami           = "ami-065b889ab5c33720e" //Windows Server 2019
  instance_type = "t3.medium"
  key_name      = "eli_k8s"
  count         = 2
  tags = {
    Name = "k8s-worker"
    Type = "worker"
  }
  security_groups = ["${aws_security_group.k8s-sg.name}"]
}

resource "aws_instance" "kubernetes-master" {
  ami           = "ami-065b889ab5c33720e" //Windows Server 2019
  instance_type = "t3.medium"
  key_name      = "eli_k8s"
  count         = 1
  tags = {
    Name = "k8s-master"
    Type = "master"
  }
  security_groups = ["${aws_security_group.k8s-sg.name}"]
}
