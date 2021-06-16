# Installs and manages Oddjob.
#
# @example Declaring the class
#   include dbus
#   include oddjob
#
# @param conf_dir Top-level configuration directory, usually
#   `/etc/oddjobd.conf.d`.
# @param package_name The name of the package.
# @param service_name The service name.
#
# @see puppet_classes::oddjob::mkhomedir oddjob::mkhomedir
# @see puppet_defined_types::oddjob::helper oddjob::helper
class oddjob (
  Stdlib::Absolutepath $conf_dir     = $oddjob::params::conf_dir,
  String               $package_name = $oddjob::params::package_name,
  String               $service_name = $oddjob::params::service_name,
) inherits oddjob::params {

  contain oddjob::install
  contain oddjob::config
  contain oddjob::service

  Class['oddjob::install'] -> Class['oddjob::config']
    ~> Class['oddjob::service']
}
