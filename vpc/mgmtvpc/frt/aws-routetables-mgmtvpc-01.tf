provider "aws" {
  access_key = "AKIA57K4OIW7NOBQMXXP"
  secret_key = "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"
  region     = "eu-west-3"
}

resource "aws_route_table" "onx-aws-routetables-mgmtvpc-01" {
 vpc_id = "vpc-0317680e9bab9e292"
 route {
   cidr_block = "10.0.0.0/24"
   gateway_id = "igw-01b685e0ec28bc292"
 }
 tags = {
        Name = "onx-aws-routetables-mgmtvpc-01"
}
}
#il y aura une erreur --> mettre cette table de routage en tant que principale et supprimer l'ancienne (l'ancienne a été créé automatiquement pendant les étapes précedentes)
#attacher au internet gateway (sur la table de routage)

