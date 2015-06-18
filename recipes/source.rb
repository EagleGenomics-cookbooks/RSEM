#
# Cookbook Name:: RSEM
# Recipe:: source
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

log 'Starting RSEM recipe'

include_recipe 'build-essential'

# Placed here for use by serverspec
cookbook_file 'default_attributes.rb' do
  path '/tmp/default_attributes.rb'
  action :create
  owner 'root'
  group 'root'
  mode 0755
end

git RSEM  do
  repository 'https://github.com/deweylab/RSEM.git'
  revision 'master'
  action :checkout
end


log 'Finished RSEM recipe'

