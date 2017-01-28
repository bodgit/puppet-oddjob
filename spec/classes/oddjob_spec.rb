require 'spec_helper'

describe 'oddjob' do

  let(:pre_condition) do
    'include ::dbus'
  end

  context 'on unsupported distributions' do
    let(:facts) do
      {
        :osfamily => 'Unsupported'
      }
    end

    it { expect { should compile }.to raise_error(/not supported on an Unsupported/) }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}", :compile do
      let(:facts) do
        facts
      end

      it { should contain_class('oddjob') }
      it { should contain_class('oddjob::config') }
      it { should contain_class('oddjob::install') }
      it { should contain_class('oddjob::params') }
      it { should contain_class('oddjob::service') }
      it { should contain_dbus__system('oddjob') }
      it { should contain_file('/etc/oddjob') }
      it { should contain_file('/etc/oddjobd.conf') }
      it { should contain_file('/etc/oddjobd.conf.d') }
      it { should contain_file('/etc/oddjobd.conf.d/oddjobd-introspection.conf') }
      it { should contain_oddjob__helper('introspection') }
      it { should contain_package('oddjob') }
      it { should contain_service('oddjobd') }
    end
  end
end
