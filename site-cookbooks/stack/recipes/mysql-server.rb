# -*- mode: ruby; coding: utf-8; -*-

# Creation du repertoire pour le 'preseeding' des pacquets debian/ubuntu
directory '/var/cache/local/preseeding' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
end

# Template 'preseeding' mysql server
# Puis executer immediatement la resource 'preseed mysql-server'
# TODO: Verifier que le template 'template/default/mysql-server.seed.erb'
# pour remplacer utiliser le bon mot de passe
template '/var/cache/local/preseeding/mysql-server.seed' do
  source 'mysql-server.seed.erb'
  owner 'root'
  group 'root'
  mode '0600'
  notifies :run, 'execute[preseed mysql-server]', :immediately
end

# debconf-set-selections permet de renseigner la base de donnees de debconf avec
# les reponses aux questions. Cela permettra une installation fluide.
execute 'preseed mysql-server' do
  command '/usr/bin/debconf-set-selections /var/cache/local/preseeding/mysql-server.seed'
  action  :nothing
end

# Installation du package mysql
# TODO: utiliser la ressource 'package' pour installer le package 'mysql'
package 'mysql-server' do
  action :install
end

# service manage par Chef
# TODO: utiliser la resource 'service' pour gerer le service mysql
service 'mysql' do
  service_name 'mysql'
  supports     status: true, restart: true, reload: true
  action       [:enable, :start]
end
