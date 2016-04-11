require 'spec_helper_acceptance'

describe 'oddjob' do

  it 'should work with no errors' do

    pp = <<-EOS
      include ::dbus
      include ::oddjob
    EOS

    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes  => true)
  end

  describe package('oddjob') do
    it { should be_installed }
  end

  describe file('/etc/dbus-1/system.d/oddjob.conf') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its(:content) { should match /busconfig/ }
  end

  describe file('/etc/oddjob') do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  describe file('/etc/oddjobd.conf') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its(:content) { should match /oddjobconfig/ }
  end

  describe file('/etc/oddjobd.conf.d') do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  describe file('/etc/oddjobd.conf.d/oddjobd-introspection.conf') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its(:content) { should match /oddjobconfig/ }
  end

  describe service('oddjobd') do
    it { should be_enabled }
    it { should be_running }
  end
end
