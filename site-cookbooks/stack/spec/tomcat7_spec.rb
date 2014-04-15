# -*- mode: ruby; coding: utf-8; -*-
require 'spec_helper'

describe 'stack::tomcat7' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs tomcat 7' do
    # TODO: verifier que la ressource 'package' tomcat7 est installe
    expect(chef_run).to install_package 'tomcat7'
  end

  it 'put setenv.sh file' do
    # TODO: verifier que la resource 'template' '/usr/share/tomcat7/bin/setenv.sh' est bien 
    # appelé avec 'tomcat7' comme owner et group
    expect(chef_run).to create_template('/usr/share/tomcat7/bin/setenv.sh')
      .with_path('/usr/share/tomcat7/bin/setenv.sh')
      .with_owner('tomcat7')
      .with_group('tomcat7')

    # TODO: verifier que le contenu du fichier '/usr/share/tomcat7/bin/setenv.sh'
    # contient bien le mot 'spring.profiles.active=prod'
    expect(chef_run).to render_file('/usr/share/tomcat7/bin/setenv.sh').with_content(/spring.profiles.active=prod/)
    resource = chef_run.template('/usr/share/tomcat7/bin/setenv.sh')
    expect(resource).to notify('service[tomcat7]').to(:restart).delayed
  end

  it 'service tomcat 7' do
    # TODO: verifier que le service 'tomcat7' est demarre et sera demarre au boot
    expect(chef_run).to start_service 'tomcat7'
    expect(chef_run).to enable_service 'tomcat7'
  end

  it 'copy jhipster war to tomcat' do
    # TODO: verifier que le fichier '/var/lib/tomcat7/webapps/ROOT.war' sera créé
    expect(chef_run).to create_file('/var/lib/tomcat7/webapps/ROOT.war')

    # TODO: verifier que la resource template notifiera le service tomcat7 en différé
    resource = chef_run.file('/var/lib/tomcat7/webapps/ROOT.war')
    expect(resource).to notify('service[tomcat7]').to(:restart).delayed
  end

end
