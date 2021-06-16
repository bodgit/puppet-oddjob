require 'spec_helper_acceptance'

describe 'oddjob::mkhomedir' do
  it 'works with no errors' do
    pp = <<-EOS
      include ::dbus
      include ::oddjob
      include ::oddjob::mkhomedir

      group { 'test':
        ensure => present,
        gid    => 2000,
      }

      user { 'test':
        ensure     => present,
        gid        => 'test',
        home       => '/home/test',
        managehome => false,
        uid        => 2000,
        require    => Group['test'],
      }
    EOS

    apply_manifest(pp, catch_failures: true)
    apply_manifest(pp, catch_changes: true)
  end

  describe package('oddjob-mkhomedir') do
    it { is_expected.to be_installed }
  end

  describe file('/etc/dbus-1/system.d/oddjob-mkhomedir.conf') do
    it { is_expected.to be_file }
    it { is_expected.to be_mode 644 }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into 'root' }
    its(:content) { is_expected.to match(%r{busconfig}) }
  end

  describe file('/etc/oddjobd.conf.d/oddjobd-mkhomedir.conf') do
    it { is_expected.to be_file }
    it { is_expected.to be_mode 644 }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into 'root' }
    its(:content) { is_expected.to match(%r{oddjobconfig}) }
  end

  describe file('/home/test') do
    it { is_expected.not_to be_exist }
  end

  # A small sleep seems necessary for everything to become ready on el6
  describe command('sleep 5s') do
    its(:exit_status) { is_expected.to eq 0 }
  end

  describe command('dbus-send --system --dest=com.redhat.oddjob_mkhomedir --print-reply / com.redhat.oddjob_mkhomedir.mkhomedirfor string:"test"') do
    its(:exit_status) { is_expected.to eq 0 }
    its(:stdout) do
      is_expected.to match(%r{int32 0$})
      is_expected.to match(%r{string "Creating home directory for test."$})
    end
  end

  describe file('/home/test') do
    it { is_expected.to be_directory }
    it { is_expected.to be_mode 700 }
    it { is_expected.to be_owned_by 'test' }
    it { is_expected.to be_grouped_into 'test' }
  end
end
