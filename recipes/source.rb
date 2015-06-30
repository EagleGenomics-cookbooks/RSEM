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

##########################################################

package ['zlib-devel'] do
  action :install
end

include_recipe 'r'

git node['RSEM']['dir'] do
  repository 'https://github.com/deweylab/RSEM.git'
  revision node['RSEM']['version']
  action :sync
end

execute "make" do
  cwd node['RSEM']['dir']
end

execute "find #{node['RSEM']['dir']} -maxdepth 1 -name 'rsem-*' -executable -type f -exec ln -s {} . \\;" do
  cwd node['RSEM']['install'] + '/bin'
end

['WHAT_IS_NEW','rsem_perl_utils.pm'].each do |binFile|
  execute "ln -s #{node['RSEM']['dir']}/#{binFile} ." do
    cwd node['RSEM']['install'] + '/bin'
  end
end

log 'Finished RSEM recipe'

