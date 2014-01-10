#
# Cookbook Name:: rstool
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template "/root/.rsdns_config" do
  source "rsdns_config.erb"
  owner "root"
  group "root"
  mode 0400
  not_if {File.exists?("/root/.rsdns_config")}
end


git "/tmp/rsdns" do
  repository "git://github.com/linickx/rsdns.git"
  reference "master"
  action :sync
end


script "copy-files" do
  interpreter "bash"
  user "root"
  code <<-EOH
    cp -R /tmp/rsdns/* /usr/local/bin/
  EOH
end
