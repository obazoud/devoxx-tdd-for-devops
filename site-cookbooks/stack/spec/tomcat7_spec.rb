# -*- mode: ruby; coding: utf-8; -*-
require 'spec_helper'

describe 'stack::tomcat7' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs tomcat 7' do
    # TODO: verifier que la ressource 'package' tomcat7 est installe
    pending
  end

  it 'put setenv.sh file' do
    # TODO: verifier que la resource 'template' '/usr/share/tomcat7/bin/setenv.sh' est bien 
    # appelé avec 'tomcat7' comme owner et group
    pending

    # TODO: verifier que le contenu du fichier '/usr/share/tomcat7/bin/setenv.sh'
    # contient bien le mot 'spring.profiles.active=prod'
    pending
  end

  it 'service tomcat 7' do
    # TODO: verifier que le service 'tomcat7' est demarre et sera demarre au boot
    pending
  end

  it 'copy jhipster war to tomcat' do
    # TODO: verifier que le fichier '/var/lib/tomcat7/webapps/ROOT.war' sera créé
    pending

    # TODO: verifier que la resource template notifiera le service tomcat7 en différé
    pending
  end

end
