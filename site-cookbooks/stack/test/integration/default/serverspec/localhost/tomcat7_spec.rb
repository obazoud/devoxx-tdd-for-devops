# -*- mode: ruby; coding: utf-8; -*-
require 'spec_helper'

# http://serverspec.org/resource_types.html

# TODO: verifier que le package tomcat7 est installe
describe package('tomcat7') do
  it { should be_installed }
end

# TODO: verifier que le service tomcat7 est 'running' et 'enable'
describe service('tomcat7') do
  it { should be_enabled   }
  it { should be_running   }
end

# TODO: verifier qu'un processus ecoute le port 8080
describe port(8080) do
  it { should be_listening }
end

# TODO: verifier que le fichier suivant est present sur le disque
describe file('/opt/apps/jhipster.war') do
  it { should be_file }
end

# TODO: verifier que le fichier suivant est present sur le disque
describe file('/var/lib/tomcat7/webapps/ROOT.war') do
  it { should be_file }
end

# TODO: pour allez plus loin, vous pouvez ajouter des tests complementaires
