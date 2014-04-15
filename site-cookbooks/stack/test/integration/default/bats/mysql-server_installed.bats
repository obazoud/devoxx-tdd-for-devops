#!/usr/bin/env bats

# https://github.com/sstephenson/bats

@test "it creates mysql data directory" {
  # TODO: verifier que le repertoire /var/lib/mysql existe
  test -d /var/lib/mysql
}

@test "it creates mysql user" {
  # TODO: verifier que le user existe (utiliser la commande 'id')
  id mysql
}

@test "it creates mysql init.d script" {
  # TODO: verifier que le fichier /etc/init.d/mysql
  test -f /etc/init.d/mysql
}

@test 'check mysql service with ps' {
  # TODO: verifier que le process mysql est present
  ps -ef | grep -v grep | grep mysql
}

@test 'check mysql service with init.d' {
  # TODO: verifier que le status du service mysql est correct
  service mysql status
}

@test 'it should listen on 3306' {
  # TODO: verifier qu'un processus ecoute sur le port 3306
  netstat -tunl | grep -- "tcp.*:3306 "
}
