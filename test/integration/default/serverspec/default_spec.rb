require 'serverspec'
require_relative './spec_helper'

# Required by serverspec
set :backend, :exec

describe file(ENV['RSEM_DIR']) do
  it { should be_directory }
end

['rsem-bam2readdepth', 'rsem-tbam2gbam', 'rsem-prepare-reference'].each do |file_executable|
  describe command("which #{file_executable}") do
    its(:exit_status) { should eq 0 }
  end

  file_path = ENV['RSEM_INSTALL'] + '/bin/' + file_executable
  describe file(file_path) do
    it { should be_file }
    it { should be_executable }
  end
end

describe command('rsem-bam2readdepth') do
  its(:stdout) { should contain('Usage: ') }
end

describe command('rsem-tbam2gbam') do
  its(:stdout) { should contain('Usage: ') }
end

describe command('rsem-prepare-reference') do
  its(:stderr) { should contain('Invalid number of arguments') }
end

['WHAT_IS_NEW', 'rsem_perl_utils.pm'].each do |file|
  file_path = ENV['RSEM_INSTALL'] + '/bin/' + file
  describe file(file_path) do
    it { should be_file }
  end
end
