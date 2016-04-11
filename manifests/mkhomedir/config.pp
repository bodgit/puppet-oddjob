#
class oddjob::mkhomedir::config {

  ::oddjob::helper { 'mkhomedir':
    content      => file('oddjob/oddjobd-mkhomedir.conf'),
    dbus_content => file('oddjob/oddjob-mkhomedir.conf'),
  }
}
