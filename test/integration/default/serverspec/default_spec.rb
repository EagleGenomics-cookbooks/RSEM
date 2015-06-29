require 'spec_helper'
require_relative './spec_helper'

# Required by serverspec
set :backend, :exec

pseudo_node = PseudoNode.new

puts 'RSEM version = ' + pseudo_node.default['RSEM']['version']

describe file("#{pseudo_node.default['RSEM']['dir']}") do
  it { should be_directory }
end



