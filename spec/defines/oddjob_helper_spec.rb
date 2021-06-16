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
      content: '',
    }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'and no dbus specified' do
        it { is_expected.to compile.with_all_deps }

        it { is_expected.not_to contain_dbus__system('oddjob-test') }
        it { is_expected.to contain_file('/etc/oddjobd.conf.d/oddjobd-test.conf') }
        it { is_expected.to contain_oddjob__helper('test') }
      end

      context 'and dbus specified' do
        let(:params) do
          super().merge(
            {
              dbus_content: 'test',
            },
          )
        end

        it { is_expected.to compile.with_all_deps }

        it { is_expected.to contain_dbus__system('oddjob-test') }
        it { is_expected.to contain_file('/etc/oddjobd.conf.d/oddjobd-test.conf') }
        it { is_expected.to contain_oddjob__helper('test') }
      end
    end
  end
end
