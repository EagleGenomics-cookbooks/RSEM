require 'serverspec'
require_relative './spec_helper'

# Required by serverspec
set :backend, :exec

puts 'RSEM version ENV = ' + ENV['RSEM_DIR']

describe file("#{ENV['RSEM_DIR']}") do
  it { should be_directory }
end

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
