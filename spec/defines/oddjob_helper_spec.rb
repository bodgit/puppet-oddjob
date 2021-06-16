require 'spec_helper'

describe 'oddjob::helper' do
  let(:pre_condition) do
    'include ::dbus'
  end

  let(:title) do
    'test'
  end

  let(:params) do
    {
      :content => '',
    }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'and no dbus specified' do
        it { should compile.with_all_deps }

        it { should_not contain_dbus__system('oddjob-test') }
        it { should contain_file('/etc/oddjobd.conf.d/oddjobd-test.conf') }
        it { should contain_oddjob__helper('test') }
      end

      context 'and dbus specified' do
        let(:params) do
          super().merge(
            {
              :dbus_content => 'test',
            }
          )
        end

        it { should compile.with_all_deps }

        it { should contain_dbus__system('oddjob-test') }
        it { should contain_file('/etc/oddjobd.conf.d/oddjobd-test.conf') }
        it { should contain_oddjob__helper('test') }
      end
    end
  end
end
