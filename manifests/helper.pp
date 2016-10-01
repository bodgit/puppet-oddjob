#
define oddjob::helper (
  $content,
  $dbus_content = undef,
) {

  if ! defined(Class['::oddjob']) {
    fail('You must include the oddjob base class before using any oddjob defined resources')
  }

  validate_string($content)
  validate_string($dbus_content)

  if $dbus_content {
    ::dbus::system { "oddjob-${name}":
      content => $dbus_content,
    }
  }

  file { "${::oddjob::conf_dir}/oddjobd-${name}.conf":
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => $content,
    notify  => Class['::oddjob::service'],
  }
}
