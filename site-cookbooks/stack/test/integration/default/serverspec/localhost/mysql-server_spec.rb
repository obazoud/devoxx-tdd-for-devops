# -*- mode: ruby; coding: utf-8; -*-
require 'spec_helper'

# http://serverspec.org/resource_types.html

# TODO: verifier que le package mysql-server est installe
describe package('mysql-server') do
  it { pending }
end

# TODO: verifier que le service mysql est 'running' et 'enable'
describe service('mysql') do
  it { pending }
  it { pending }
end

# TODO: verifier qu'un processus ecoute le port 3306
describe port(3306) do
  it { pending }
end

# TODO: verifier que la base de donnees jhipter est presente
# tips: tester le code retour de la commande
describe command("/usr/bin/mysql -NBe \"SHOW DATABASES LIKE 'jhipster'\" --user=root --password=root") do
  it { pending }
end

# TODO: pour allez plus loin, vous pouvez ajouter des tests complementaires
