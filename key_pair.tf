resource "aws_key_pair" "key_pair_ec2_instance" {
    key_name = "key_pair_IAC"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4qRi2oZzHf/IexbibzOmA+OTqKGWABKOl4TLqYhR02z297Ubg6HXvXo7tOIGKEQJj7g0XQKbaBOMDG/UFvlwdiiBiQ84qtOaXAa2XDTE1Rs2mXy+86S3rXguZb/5AK3ypowMkYq+vy2XI/kjbyFmqtM9Mb9WwEddNFk5Qozp5n3xMBwKB1AgP4+h9+Eefeblfpq6QecFdxdmzWPsl3rC5hOd1DIcYkPdzi+noIUscOGMMiOSMlTL6rL1xUWERcZsP/DaU7y/c4+RJfN5fOIbMbjKyWStoLl7VbZa5ml8mTThneGiJUnvWbJrTieUQez2KHv77h/4fcIgRPDqaqFT4mzxpuMF04isOvsBpnV4DijV94WkXxRDq2wWL783bhNypxypsl8jFlO4EzO8kx55MuCcdEg0NH2zGtRy4si3YY5jR+d1c0WAK4Soik1VhY2JlKZJSEWJeOMweN0lGmnj42XSnH+97PgSkXH8x9JN66ErjPRXqw+UHVgHC4Nw+eSE= Sergio@Sergio-PC"

    tags = {
        Name = "${local.name}.kp.diogenes@gmail.com"
    }
}