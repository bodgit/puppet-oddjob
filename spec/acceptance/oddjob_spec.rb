require 'spec_helper_acceptance'

describe 'oddjob' do
  it 'works with no errors' do
    pp = <<-EOS
      include ::dbus
      include ::oddjob
    EOS

    apply_manifest(pp, catch_failures: true)
    apply_manifest(pp, catch_changes: true)
  end

  describe package('oddjob') do
    it { is_expected.to be_installed }
  end

  describe file('/etc/dbus-1/system.d/oddjob.conf') do
    it { is_expected.to be_file }
    it { is_expected.to be_mode 644 }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into 'root' }
    its(:content) { is_expected.to match(%r{busconfig}) }
  end

  describe file('/etc/oddjob') do
    it { is_expected.to be_directory }
    it { is_expected.to be_mode 755 }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into 'root' }
  end

  describe file('/etc/oddjobd.conf') do
    it { is_expected.to be_file }
    it { is_expected.to be_mode 644 }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into 'root' }
    its(:content) { is_expected.to match(%r{oddjobconfig}) }
  end

  describe file('/etc/oddjobd.conf.d') do
    it { is_expected.to be_directory }
    it { is_expected.to be_mode 755 }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into 'root' }
  end

  describe file('/etc/oddjobd.conf.d/oddjobd-introspection.conf') do
    it { is_expected.to be_file }
    it { is_expected.to be_mode 644 }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into 'root' }
    its(:content) { is_expected.to match(%r{oddjobconfig}) }
  end

  describe service('oddjobd') do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end
end
