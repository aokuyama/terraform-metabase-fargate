resource "aws_vpc" "current" {
  cidr_block = var.cidr_vpc
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_subnet" "current-1a" {
  availability_zone       = "ap-northeast-1a"
  vpc_id                  = aws_vpc.current.id
  cidr_block              = var.cidr_subnet["a"]
  map_public_ip_on_launch = true
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_subnet" "current-1c" {
  availability_zone       = "ap-northeast-1c"
  vpc_id                  = aws_vpc.current.id
  cidr_block              = var.cidr_subnet["c"]
  map_public_ip_on_launch = true
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_subnet" "current-1d" {
  availability_zone       = "ap-northeast-1d"
  vpc_id                  = aws_vpc.current.id
  cidr_block              = var.cidr_subnet["d"]
  map_public_ip_on_launch = true
  lifecycle {
    ignore_changes = [tags]
  }
}
