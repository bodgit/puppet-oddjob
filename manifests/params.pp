# @!visibility private
class oddjob::params {

  case $facts['os']['family'] {
    'RedHat': {
      $conf_dir               = '/etc/oddjobd.conf.d'
      $mkhomedir_package_name = 'oddjob-mkhomedir'
      $package_name           = 'oddjob'
      $service_name           = 'oddjobd'
    }
    default: {
      fail("The ${module_name} module is not supported on an ${facts['os']['family']} based system.")
    }
  }
}
