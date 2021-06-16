# oddjob

Tested with Travis CI

[![Build Status](https://travis-ci.org/bodgit/puppet-oddjob.svg?branch=master)](https://travis-ci.org/bodgit/puppet-oddjob)
[![Coverage Status](https://coveralls.io/repos/bodgit/puppet-oddjob/badge.svg?branch=master&service=github)](https://coveralls.io/github/bodgit/puppet-oddjob?branch=master)
[![Puppet Forge](http://img.shields.io/puppetforge/v/bodgit/oddjob.svg)](https://forge.puppetlabs.com/bodgit/oddjob)
[![Dependency Status](https://gemnasium.com/bodgit/puppet-oddjob.svg)](https://gemnasium.com/bodgit/puppet-oddjob)

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with oddjob](#setup)
    * [What oddjob affects](#what-oddjob-affects)
    * [Beginning with oddjob](#beginning-with-oddjob)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This module manages oddjob, a D-Bus service which performs random tasks.

## Setup

### What oddjob affects

This module installs and manages the oddjob D-Bus service and the mkhomedir
oddjob helper.

### Beginning with oddjob

In the very simplest case, you can just include the following:

```puppet
include dbus
include oddjob
```

## Usage

To install the mkhomedir Oddjob job:

```puppet
include dbus
include oddjob
include oddjob::mkhomedir
```

You will then likely want to configure the PAM stack to utilise this.

## Reference

The reference documentation is generated with
[puppet-strings](https://github.com/puppetlabs/puppet-strings) and the latest
version of the documentation is hosted at
[https://bodgit.github.io/puppet-oddjob/](https://bodgit.github.io/puppet-oddjob/).

## Limitations

This module has been built on and tested against Puppet 4.4.0 and higher.

The module has been tested on:

* RedHat Enterprise Linux 6/7

## Development

The module has both [rspec-puppet](http://rspec-puppet.com) and
[beaker-rspec](https://github.com/puppetlabs/beaker-rspec) tests. Run them
with:

```
$ bundle exec rake test
$ PUPPET_INSTALL_TYPE=agent PUPPET_INSTALL_VERSION=x.y.z bundle exec rake beaker:<nodeset>
```

Please log issues or pull requests at
[github](https://github.com/bodgit/puppet-oddjob).
