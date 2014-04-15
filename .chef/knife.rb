# Configuration
current_dir             = File.dirname(__FILE__)

# Logging
log_level               :info
log_location            STDOUT

# Cookbooks
cookbook_path           ["#{current_dir}/../site-cookbooks"]

cache_options({ :path => "#{current_dir}/../.chef/cache/checksums", :skip_expires => true })