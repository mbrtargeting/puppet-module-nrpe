require 'spec_helper'

describe 'nrpe' do

  let :facts do
    { osfamily: 'RedHat' }
  end

  it { should contain_package('nrpe').with_ensure('installed') }
  it { should contain_package('nagios-plugins-all').with_ensure('installed') }
  it { should contain_service('nrpe_service').with_ensure('running') }
  it { should contain_file('nrpe_config') }
  it { should contain_file('nrpe_include_dir').with_ensure('directory') }

  context 'when manage_package is false' do
    let(:params) {{:manage_package => false}}

    it { should_not contain_package('nrpe') }
  end

end
