#
class oddjob::install {

  package { $::oddjob::package_name:
    ensure => present,
  }
}
