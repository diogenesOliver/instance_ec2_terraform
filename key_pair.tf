resource "aws_key_pair" "key_pair_ec2_instance" {
  key_name   = "key_pair_IAC"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCzAcYR7jXYzYotqVe4bQKEoq5wvh/1Zw0LEKSBmK2VqGmiJylsao81bCo9czUzcYVz8GzCBf31834LGx76Aq1wqbrokTWtCc/ZdIS2Gf7mXyvx/Y5Rl3JNbyqlvE5LQ8BiMR/k38pB/Y3UtHK7NvZ3tiaoqJiJretlblUTRk+UNP7QZ7uMLjWE8VughT3GHPFuYdOKKc7C4FaQv+dgSvE/ubnuxRWxmS0znt1+QQssyw8JdJeXbhf0bL+9km1m2VZkw2B+72Sly+SWNUXiSTF1FJb/hNOlauLfpmwb2ltL1RHMLYd0mLhhw6Tib2k9pcEt6LOH9FdgZGMJ9gGy8lsm6W3KYKingb4IHg5BAURlUKE1T8ksfen3pHVBwcMzkJneGlKNRIvFwUKFY8DyWe0HUsmKCYJkafXRfXox0W7KhU6fpEuUOI3+tvVLNJ1Mwj7os2fiL27h0NY8PouirUMF5VPsenNzPlNsfov5Zi/U8lr0dxLubs2TZWY85vHMb+k= dioge@DESKTOP-KNVCBQI"

  tags = {
    Name = "${local.name}.kp.diogenes@gmail.com"
  }
}