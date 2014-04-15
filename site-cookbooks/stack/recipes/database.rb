# -*- mode: ruby; coding: utf-8; -*-

create_database = "/usr/bin/mysql -NBe \"CREATE DATABASE #{node['stack']['mysql']['database']}"
create_database += ' DEFAULT CHARACTER SET = utf8'
create_database += ' DEFAULT COLLATE utf8_general_ci"'
create_database += ' --user=root'
create_database += " --password=#{node['stack']['mysql']['server_root_password']}"

check_database = "/usr/bin/mysql -NBe \"SHOW DATABASES LIKE '#{node['stack']['mysql']['database']}'\""
check_database += ' --user=root'
check_database += " --password=#{node['stack']['mysql']['server_root_password']}"
check_database += " | grep --quiet #{node['stack']['mysql']['database']}"

Chef::Log.info("Creating database #{node['stack']['mysql']['database']}")

execute 'create-database' do
  command create_database
  not_if  check_database
end
