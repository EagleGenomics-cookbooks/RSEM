require 'serverspec'
require_relative './spec_helper'

# Required by serverspec
set :backend, :exec

pseudo_node = PseudoNode.new

puts 'RSEM version = ' + pseudo_node.default['RSEM']['version']

describe file("#{pseudo_node.default['RSEM']['dir']}") do
  it { should be_directory }
end

set :path, '/usr/local/bin/:$PATH'

['rsem-bam2readdepth','rsem-tbam2gbam','rsem-prepare-reference'].each do |fileExecutable|

  describe command("which #{fileExecutable}") do
    its(:exit_status) { should eq 0 }
  end
  
  filePath = '/usr/local/bin/' + fileExecutable
  
  describe file(filePath) do
    it { should be_file }
    it { should be_executable }
  end
end 

['WHAT_IS_NEW','rsem_perl_utils.pm'].each do |fileExecutable|

  filePath = '/usr/local/bin/' + fileExecutable
  
  describe file(filePath) do
    it { should be_file }
  end
end
