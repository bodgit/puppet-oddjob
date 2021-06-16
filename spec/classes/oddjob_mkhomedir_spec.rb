require 'spec_helper'

describe 'oddjob::mkhomedir' do

  let(:pre_condition) do
    'include ::dbus'
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { should compile.with_all_deps }

      it { should contain_class('oddjob::mkhomedir') }
      it { should contain_class('oddjob::mkhomedir::config') }
      it { should contain_class('oddjob::mkhomedir::install') }
      it { should contain_dbus__system('oddjob-mkhomedir') }
      it { should contain_file('/etc/oddjobd.conf.d/oddjobd-mkhomedir.conf') }
      it { should contain_oddjob__helper('mkhomedir') }
      it { should contain_package('oddjob-mkhomedir') }
    end
  end
end
