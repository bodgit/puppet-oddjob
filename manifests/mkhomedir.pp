# Installs the Oddjob mkhomedir job.
#
# @example Declaring the class
#   include ::dbus
#   include ::oddjob
#   include ::oddjob::mkhomedir
#
# @param package_name The name of the package.
#
# @see puppet_classes::oddjob ::oddjob
class oddjob::mkhomedir (
  String $package_name = $::oddjob::params::mkhomedir_package_name,
) inherits ::oddjob::params {

  if ! defined(Class['::oddjob']) {
    fail('You must include the oddjob base class before using the oddjob::mkhomedir class')
  }

  contain ::oddjob::mkhomedir::install
  contain ::oddjob::mkhomedir::config

  Class['::oddjob::mkhomedir::install'] -> Class['::oddjob::mkhomedir::config']
}
