#
# Cookbook Name:: RSEM
# Spec:: default
#
# Copyright (c) 2016 Eagle Genomics Ltd, Apache License, Version 2.0.

require 'spec_helper'

describe 'RSEM::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end
    before do
      stub_command('R --version | grep -q 3.0.1').and_return(true)
    end
    it 'converges successfully' do
      chef_run # This should not raise an error
    end
  end
end
