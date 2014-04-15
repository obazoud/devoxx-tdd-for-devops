# -*- mode: ruby; coding: utf-8; -*-
require 'spec_helper'

describe 'stack::mysql-server' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'set up preseeding data for debian packages' do
    # TODO: verifier que la resource 'directory' est bien 
    # appelé avec 'root' comme owner et group
    expect(chef_run).to create_directory('/var/cache/local/preseeding')
      .with_owner('root')
      .with_group('root')
  end

  it 'put mysql-server preseeding file' do
    # TODO: verifier que la ressource 'template' /var/cache/local/preseeding/mysql-server.seed
    # est appelé avec 'root' comme owner et group
    expect(chef_run).to create_template('/var/cache/local/preseeding/mysql-server.seed')
      .with_path('/var/cache/local/preseeding/mysql-server.seed')
      .with_owner('root')
      .with_group('root')

    # TODO: verifier que le contenu du fichier '/var/cache/local/preseeding/mysql-server.seed'
    # contient bien le mot de passe 'root'
    content_password_again = /mysql-server-5.0        mysql-server\/root_password_again        select root$/
    content_password = /mysql-server-5.0        mysql-server\/root_password      select root$/

    expect(chef_run).to render_file('/var/cache/local/preseeding/mysql-server.seed').with_content(content_password_again)
    expect(chef_run).to render_file('/var/cache/local/preseeding/mysql-server.seed').with_content(content_password)

    # TODO: verifier que la resource template notifiera la ressource 'preseed mysql-server' immediatement
    resource = chef_run.template('/var/cache/local/preseeding/mysql-server.seed')
    expect(resource).to notify('execute[preseed mysql-server]').to(:run).immediately
  end

  it 'installs mysql-server' do
    # TODO: verifier que la ressource 'package' mysql-server est installe
    expect(chef_run).to install_package 'mysql-server'
  end

  it 'service mysql' do
    # TODO: verifier que le service 'mysql' est demarre et sera demarre au boot
    expect(chef_run).to start_service 'mysql'
    expect(chef_run).to enable_service 'mysql'
  end

end
