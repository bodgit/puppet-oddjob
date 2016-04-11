require 'spec_helper_acceptance'

describe 'oddjob::mkhomedir' do

  it 'should work with no errors' do

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

    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes  => true)
  end

  describe package('oddjob-mkhomedir') do
    it { should be_installed }
  end

  describe file('/etc/dbus-1/system.d/oddjob-mkhomedir.conf') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its(:content) { should match /busconfig/ }
  end

  describe file('/etc/oddjobd.conf.d/oddjobd-mkhomedir.conf') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its(:content) { should match /oddjobconfig/ }
  end

  describe file('/home/test') do
    it { should_not be_exist }
  end

  # A small sleep seems necessary for everything to become ready on el6
  describe command('sleep 5s') do
    its(:exit_status) { should eq 0 }
  end

  describe command('dbus-send --system --dest=com.redhat.oddjob_mkhomedir --print-reply / com.redhat.oddjob_mkhomedir.mkhomedirfor string:"test"') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should match /int32 0$/ }
    its(:stdout) { should match /string "Creating home directory for test."$/ }
  end

  describe file('/home/test') do
    it { should be_directory }
    it { should be_mode 700 }
    it { should be_owned_by 'test' }
    it { should be_grouped_into 'test' }
  end
end
