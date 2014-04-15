# -*- mode: ruby; coding: utf-8; -*-

%w{mysql-client libmysqlclient-dev}.each do |pkg|
  package pkg do
    action :install
  end
end
