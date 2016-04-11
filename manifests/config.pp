#
class oddjob::config {

  ::dbus::system { 'oddjob':
    content => file('oddjob/oddjob.conf'),
  }

  # FIXME Needed?
  file { '/etc/oddjob':
    ensure => directory,
    owner  => 0,
    group  => 0,
    mode   => '0644',
  }

  file { '/etc/oddjobd.conf':
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => file('oddjob/oddjobd.conf'),
  }

  file { $::oddjob::conf_dir:
    ensure => directory,
    owner  => 0,
    group  => 0,
    mode   => '0644',
  }

  ::oddjob::helper { 'introspection':
    content => file('oddjob/oddjobd-introspection.conf'),
  }
}
