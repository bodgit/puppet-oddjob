require 'spec_helper'

describe 'oddjob::helper' do
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

      context 'without oddjob class included' do
        it { expect { should compile }.to raise_error(/must include the oddjob base class/) }
      end

      context 'with oddjob class included' do
        let(:pre_condition) do
          'include ::dbus include ::oddjob'
        end

        context 'and no dbus specified', :compile do
          it { should contain_file('/etc/oddjobd.conf.d/oddjobd-test.conf') }
          it { should contain_oddjob__helper('test') }
        end

        context 'and dbus specified', :compile do
          let(:params) do
            super().merge(
              {
                :dbus_content => 'test',
              }
            )
          end

          it { should contain_dbus__system('oddjob-test') }
          it { should contain_file('/etc/oddjobd.conf.d/oddjobd-test.conf') }
          it { should contain_oddjob__helper('test') }
        end
      end
    end
  end
end
