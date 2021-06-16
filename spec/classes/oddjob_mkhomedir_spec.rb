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

      it { is_expected.to compile.with_all_deps }

      it { is_expected.to contain_class('oddjob::mkhomedir') }
      it { is_expected.to contain_class('oddjob::mkhomedir::config') }
      it { is_expected.to contain_class('oddjob::mkhomedir::install') }
      it { is_expected.to contain_dbus__system('oddjob-mkhomedir') }
      it { is_expected.to contain_file('/etc/oddjobd.conf.d/oddjobd-mkhomedir.conf') }
      it { is_expected.to contain_oddjob__helper('mkhomedir') }
      it { is_expected.to contain_package('oddjob-mkhomedir') }
    end
  end
end
