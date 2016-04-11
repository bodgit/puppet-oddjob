#
class oddjob (
  $conf_dir     = $::oddjob::params::conf_dir,
  $package_name = $::oddjob::params::package_name,
  $service_name = $::oddjob::params::service_name,
) inherits ::oddjob::params {

  validate_absolute_path($conf_dir)
  validate_string($package_name)
  validate_string($service_name)

  include ::oddjob::install
  include ::oddjob::config
  include ::oddjob::service

  anchor { 'oddjob::begin': }
  anchor { 'oddjob::end': }

  Anchor['oddjob::begin'] -> Class['::oddjob::install']
    -> Class['::oddjob::config'] ~> Class['::oddjob::service']
    -> Anchor['oddjob::end']
}
