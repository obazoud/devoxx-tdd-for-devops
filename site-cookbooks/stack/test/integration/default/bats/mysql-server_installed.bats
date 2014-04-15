#!/usr/bin/env bats

# https://github.com/sstephenson/bats

@test "it creates mysql data directory" {
  # TODO: verifier que le repertoire /var/lib/mysql existe
  skip
}

@test "it creates mysql user" {
  # TODO: verifier que le user existe (utiliser la commande 'id')
  skip
}

@test "it creates mysql init.d script" {
  # TODO: verifier que le fichier /etc/init.d/mysql
  skip
}

@test 'check mysql service with ps' {
  # TODO: verifier que le process mysql est present
  skip
}

@test 'check mysql service with init.d' {
  # TODO: verifier que le status du service mysql est correct
  skip
}

@test 'it should listen on 3306' {
  # TODO: verifier qu'un processus ecoute sur le port 3306
  skip
}
