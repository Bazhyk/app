 provider "aws" {

  region = "eu-central-1"

 } 
 
 resource "aws_instance" "webserver" {
    ami = "ami-0767046d1677be5a0"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.webserver.id] 
                                                                                          #create dependence
    user_data = file("docker-compose.sh") 
    key_name                  =   "aws_key"                                                      
   connection  {
    host= self.public_ip
    type = "ssh"
    user = "ubuntu"
    private_key = file("~/Course/secret/aws_key")
  }

   provisioner "file" {
    source      = "~/Course/dz/test/app/"
    destination = "~/"
    
  }
   
   provisioner "remote-exec" {
    inline = [
      "chmod +x ~/app/docker-compose.sh",
      "sudo ~/app/docker-compose.sh",
    ]
  }

  }

                                                                                      #bootstraping(automatically starting command)
 

resource "aws_security_group" "webserver" {
  name        = "webserver security group 2"
  description = "Security group"
 
  ingress {
   from_port = 3000
   to_port = 3000
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  }
  egress {                       
                                                                                          #out (server)
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tcp"
  }
}