#
# Cookbook Name:: RSEM
# Recipe:: source
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'build-essential'
include_recipe 'git'

##########################################################
# here for use by serverspec
magic_shell_environment 'RSEM_DIR' do
  value node['RSEM']['dir']
end

magic_shell_environment 'RSEM_VERSION' do
  value node['RSEM']['version']
end

magic_shell_environment 'RSEM_INSTALL' do
  value node['RSEM']['install']
end

##########################################################

package ['zlib-devel'] do
  action :install
end

##########################################################

include_recipe 'r'

git node['RSEM']['dir'] do
  repository 'https://github.com/deweylab/RSEM.git'
  revision node['RSEM']['version']
  action :sync
end

execute "make" do
  cwd node['RSEM']['dir']
end

# this symlinks every executable in the install subdirectory to the top of the directory tree
# so that they are in the PATH
execute "find #{node['RSEM']['dir']} -maxdepth 1 -name 'rsem-*' -executable -type f -exec ln -s {} . \\;" do
  cwd node['RSEM']['install'] + '/bin'
end

# These also need to be in PATH to run
['WHAT_IS_NEW','rsem_perl_utils.pm'].each do |binFile|
  execute "ln -s #{node['RSEM']['dir']}/#{binFile} ." do
    cwd node['RSEM']['install'] + '/bin'
  end
end
<<<<<<< HEAD

##########################################################
##########################################################
=======
>>>>>>> 951fa2de315bd318ae799f4801fac49c6c2fd8db
