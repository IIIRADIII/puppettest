require 'spec_helper'
describe 'firewallrules' do

  context 'with defaults for all parameters' do
    it { should contain_class('firewallrules') }
  end
end
