# -*- mode: ruby; coding: utf-8; -*-

include_recipe 'stack::mysql-server'
include_recipe 'stack::mysql-client'
include_recipe 'stack::database'
include_recipe 'stack::tomcat7'
