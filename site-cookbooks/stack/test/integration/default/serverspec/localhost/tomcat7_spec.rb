# -*- mode: ruby; coding: utf-8; -*-
require 'spec_helper'

# http://serverspec.org/resource_types.html

# TODO: verifier que le package tomcat7 est installe
describe package('tomcat7') do
  it { pending }
end

# TODO: verifier que le service tomcat7 est 'running' et 'enable'
describe service('tomcat7') do
  it { pending }
  it { pending }
end

# TODO: verifier qu'un processus ecoute le port 8080
describe port(8080) do
  it { pending }
end

# TODO: verifier que le fichier suivant est present sur le disque
describe file('/opt/apps/jhipster.war') do
  it { pending }
end

# TODO: verifier que le fichier suivant est present sur le disque
describe file('/var/lib/tomcat7/webapps/ROOT.war') do
  it { pending }
end

# TODO: pour allez plus loin, vous pouvez ajouter des tests complementaires
