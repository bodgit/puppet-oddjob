# @!visibility private
class oddjob::service {

  service { $::oddjob::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
