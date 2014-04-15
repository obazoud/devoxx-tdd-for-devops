#!/usr/bin/env bats

# https://github.com/sstephenson/bats

@test "it creates tomcat directory" {
  # TODO: verifier que le repertoire /var/lib/tomcat7
  test -d /var/lib/tomcat7
}

@test "it creates tomcat init.d script" {
  # TODO: verifier que le fichier /etc/init.d/tomcat7 existe
  test -f /etc/init.d/tomcat7
}

@test "it creates tomcat7 user" {
  # TODO: verifier que le user tomcat7 existe
  id tomcat7
}

@test 'check tomcat7 service with ps' {
  # TODO: verifier que le processus tomcat7 existe
  ps -ef | grep -v grep | grep tomcat7
}

@test 'check tomcat service status' {
  # TODO: verifier que le service tomcat7 a un bon status
  service tomcat7 status
}

@test 'jhipster war file should exist' {
  # TODO: verifier que le fichier /var/lib/tomcat7/webapps/ROOT.war existe
  [ -f /var/lib/tomcat7/webapps/ROOT.war ]
  # TODO: verifier que le repertoire /var/lib/tomcat7/webapps/ROOT existe
  [ -d /var/lib/tomcat7/webapps/ROOT ]
}

@test 'it should listen on 8080' {
  # TODO: verifier qu'un processu ecoute sur le port 8080
  netstat -tunl | grep -- "^tcp.*:8080"
}

@test "it responses 200 on port 8080" {
  # TODO: verifier avec curl que http://localhost:8080/ renvoie un exit status a 0
  # et comme code http 200
  run curl --write-out %{http_code} --silent --output /dev/null http://localhost:8080/
  [ "$status" -eq 0 ]
  [ "$output" = "200" ]
}

@test "it responses with 'hipster' content" {
  # TODO: verifier avec curl que http://localhost:8080/ renvoie comme contenu
  # au moins 'hipster'
  run curl http://localhost:8080/
  [ "$status" -eq 0 ]
  echo "$output" | grep 'hipster'
}
