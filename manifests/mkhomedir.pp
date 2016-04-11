#
class oddjob::mkhomedir (
  $package_name = $::oddjob::params::mkhomedir_package_name,
) inherits ::oddjob::params {

  if ! defined(Class['::oddjob']) {
    fail('You must include the oddjob base class before using the oddjob::mkhomedir class') # lint:ignore:80chars
  }

  validate_string($package_name)

  include ::oddjob::mkhomedir::install
  include ::oddjob::mkhomedir::config

  anchor { 'oddjob::mkhomedir::begin': }
  anchor { 'oddjob::mkhomedir::end': }

  Anchor['oddjob::mkhomedir::begin'] -> Class['::oddjob::mkhomedir::install']
    -> Class['::oddjob::mkhomedir::config'] -> Anchor['oddjob::mkhomedir::end']
}
