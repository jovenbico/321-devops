module "eks_cluster" {
  source = "../../eks"

  name = "dev"

  vpc_config = {
    region    = "us-east-1",
    vpc_cidr  = "10.0.0.0/16",
    count_azs = 2
  }

  tags = {
    Name = "dev"
  }
}
