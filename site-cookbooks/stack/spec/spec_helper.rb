# -*- mode: ruby; coding: utf-8; -*-
require 'chefspec'

# RSpec.configure do |config|
#  config.platform = 'ubuntu'
#  config.version = '13.04'
# end

at_exit { ChefSpec::Coverage.report! }
