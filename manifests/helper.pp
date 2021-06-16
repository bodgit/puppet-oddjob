# Helper to configure Oddjob jobs.
#
# @example
#   include ::dbus
#   include ::oddjob
#   ::oddjob::helper { 'mkhomedir':
#     content      => file('oddjob/oddjobd-mkhomedir.conf'),
#     dbus_content => file('oddjob/oddjob-mkhomedir.conf'),
#   }
#
# @param content The Oddjob job content.
# @param dbus_content The D-Bus configuration content.
# @param job The name of the Oddjob job.
#
# @see puppet_classes::oddjob ::oddjob
define oddjob::helper (
  String           $content,
  Optional[String] $dbus_content = undef,
  String           $job          = $title,
) {

  include oddjob

  if $dbus_content {
    ::dbus::system { "oddjob-${job}":
      content => $dbus_content,
    }
  }

  file { "${::oddjob::conf_dir}/oddjobd-${job}.conf":
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => $content,
    notify  => Class['::oddjob::service'],
  }
}
