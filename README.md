# oddjob

[![Build Status](https://img.shields.io/github/workflow/status/bodgit/puppet-oddjob/Test)](https://github.com/bodgit/puppet-oddjob/actions?query=workflow%3ATest)
[![Codecov](https://img.shields.io/codecov/c/github/bodgit/puppet-oddjob)](https://codecov.io/gh/bodgit/puppet-oddjob)
[![Puppet Forge version](http://img.shields.io/puppetforge/v/bodgit/oddjob)](https://forge.puppetlabs.com/bodgit/oddjob)
[![Puppet Forge downloads](https://img.shields.io/puppetforge/dt/bodgit/oddjob)](https://forge.puppetlabs.com/bodgit/oddjob)
[![Puppet Forge - PDK version](https://img.shields.io/puppetforge/pdk-version/bodgit/oddjob)](https://forge.puppetlabs.com/bodgit/oddjob)

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with oddjob](#setup)
    * [Beginning with oddjob](#beginning-with-oddjob)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This module manages oddjob, a D-Bus service which performs random tasks.

RHEL/CentOS is supported using Puppet 5 or later.

## Setup

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
[https://bodgit.github.io/puppet-oddjob/](https://bodgit.github.io/puppet-oddjob/)
and available also in the [REFERENCE.md](https://github.com/bodgit/puppet-oddjob/blob/main/REFERENCE.md).

## Limitations

This module has been built on and tested against Puppet 5 and higher.

The module has been tested on:

* Red Hat/CentOS Enterprise Linux 6/7/8

## Development

The module relies on [PDK](https://puppet.com/docs/pdk/1.x/pdk.html) and has
both [rspec-puppet](http://rspec-puppet.com) and
[Litmus](https://github.com/puppetlabs/puppet_litmus) tests. Run them
with:

```
$ bundle exec rake spec
$ bundle exec rake litmus:*
```

Please log issues or pull requests at
[github](https://github.com/bodgit/puppet-oddjob).
