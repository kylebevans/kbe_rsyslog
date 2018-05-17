#
# Author:: Kyle Evans (<kylebe@gmail.com)
# Cookbook Name:: kbe_rsyslog
# Recipe:: default
# Copyright Holder:: Kyle Evans
# Copyright Holder Email:: kylebe@gmail.com
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#
# Cookbook Name:: .
# Recipe:: fisher-syslog-settings
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package 'rsyslog'

directory '/etc/rsyslog.d' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
end

template '/etc/rsyslog.conf' do
  source 'rsyslog.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[rsyslog]', :immediately
end


service 'rsyslog' do
  supports :status => true, :start => true, :stop => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

