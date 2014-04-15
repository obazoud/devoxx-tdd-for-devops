# -*- mode: ruby; coding: utf-8; -*-
require 'spec_helper'

describe 'stack::mysql-server' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'set up preseeding data for debian packages' do
    # TODO: verifier que la resource 'directory' est bien 
    # appelé avec 'root' comme owner et group
    pending
  end

  it 'put mysql-server preseeding file' do
    # TODO: verifier que la ressource 'template' /var/cache/local/preseeding/mysql-server.seed
    # est appelé avec 'root' comme owner et group
    pending

    # TODO: verifier que le contenu du fichier '/var/cache/local/preseeding/mysql-server.seed'
    # contient bien le mot de passe 'root'
    pending

    # TODO: verifier que la resource template notifiera la ressource 'preseed mysql-server' immediatement
    pending
  end

  it 'installs mysql-server' do
    # TODO: verifier que la ressource 'package' mysql-server est installe
    pending
  end

  it 'service mysql' do
    # TODO: verifier que le service 'mysql' est demarre et sera demarre au boot
    pending
  end

end
