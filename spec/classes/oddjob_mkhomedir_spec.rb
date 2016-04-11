require 'spec_helper'

describe 'oddjob::mkhomedir' do

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
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'without oddjob class included' do
        it { expect { should compile }.to raise_error(/must include the oddjob base class/) }
      end

      context 'with oddjob class included', :compile do
        let(:pre_condition) do
          super() + ' include ::oddjob'
        end

        it { should contain_anchor('oddjob::mkhomedir::begin') }
        it { should contain_anchor('oddjob::mkhomedir::end') }
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
end
