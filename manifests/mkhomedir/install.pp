# @!visibility private
class oddjob::mkhomedir::install {

  package { $::oddjob::mkhomedir::package_name:
    ensure => present,
  }
}
