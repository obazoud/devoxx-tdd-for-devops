# -*- mode: ruby; coding: utf-8; -*-
name             'stack'
maintainer       'Olivier Bazoud'
maintainer_email 'olivier.bazoud@gmail.com'
license          'Apache license 2.0'
description      'Installs/Configures stack'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{ ubuntu }.each do |os|
  supports os
end
