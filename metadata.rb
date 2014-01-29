name             'rstool'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures rstool'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports "centos"

# == Recipes
#

recipe "rstool::setup_rsdns",
  "Install and setup Rackspace DNS tool"

# == Attributes
#
attribute "rstool",
  :display_name => "General Rackspace tool Options",
  :type => "hash"

attribute "rstool/rackspace_username",
  :display_name => "Rackspace username",
  :description =>
     "Rackspace username",
  :required => "required",
  :recipes => ["rstool::setup_rsdns"]

attribute "rstool/rackspace_auth_key",
  :display_name => "Rackspace Authkey",
  :description =>
     "Rackspace auth_key",
  :required => "required",
  :recipes => ["rstool::setup_rsdns"]
