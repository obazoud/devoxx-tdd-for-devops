#!/usr/bin/env bats

# https://github.com/sstephenson/bats

@test "it creates tomcat directory" {
  # TODO: verifier que le repertoire /var/lib/tomcat7
  skip
}

@test "it creates tomcat init.d script" {
  # TODO: verifier que le fichier /etc/init.d/tomcat7 existe
  skip
}

@test "it creates tomcat7 user" {
  # TODO: verifier que le user tomcat7 existe
  skip
}

@test 'check tomcat7 service with ps' {
  # TODO: verifier que le processus tomcat7 existe
  skip
}

@test 'check tomcat service status' {
  # TODO: verifier que le service tomcat7 a un bon status
  skip
}

@test 'jhipster war file should exist' {
  # TODO: verifier que le fichier /var/lib/tomcat7/webapps/ROOT.war existe
  skip
  # TODO: verifier que le repertoire /var/lib/tomcat7/webapps/ROOT existe
  skip
}

@test 'it should listen on 8080' {
  # TODO: verifier qu'un processu ecoute sur le port 8080
  skip
}

@test "it responses 200 on port 8080" {
  # TODO: verifier avec curl que http://localhost:8080/ renvoie un exit status a 0
  # et comme code http 200
  skip
}

@test "it responses with 'hipster' content" {
  # TODO: verifier avec curl que http://localhost:8080/ renvoie comme contenu
  # au moins 'hipster'
  skip
}
