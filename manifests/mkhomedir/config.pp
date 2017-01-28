# @!visibility private
class oddjob::mkhomedir::config {

  ::oddjob::helper { 'mkhomedir':
    content      => file("${module_name}/oddjobd-mkhomedir.conf"),
    dbus_content => file("${module_name}/oddjob-mkhomedir.conf"),
  }
}
