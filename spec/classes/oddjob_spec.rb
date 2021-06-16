require 'spec_helper'

describe 'oddjob' do
  let(:pre_condition) do
    'include ::dbus'
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }

      it { is_expected.to contain_class('oddjob') }
      it { is_expected.to contain_class('oddjob::config') }
      it { is_expected.to contain_class('oddjob::install') }
      it { is_expected.to contain_class('oddjob::params') }
      it { is_expected.to contain_class('oddjob::service') }
      it { is_expected.to contain_dbus__system('oddjob') }
      it { is_expected.to contain_file('/etc/oddjob') }
      it { is_expected.to contain_file('/etc/oddjobd.conf') }
      it { is_expected.to contain_file('/etc/oddjobd.conf.d') }
      it { is_expected.to contain_file('/etc/oddjobd.conf.d/oddjobd-introspection.conf') }
      it { is_expected.to contain_oddjob__helper('introspection') }
      it { is_expected.to contain_package('oddjob') }
      it { is_expected.to contain_service('oddjobd') }
    end
  end
end
