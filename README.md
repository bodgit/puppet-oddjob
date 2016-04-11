# oddjob

Tested with Travis CI

[![Build Status](https://travis-ci.org/bodgit/puppet-oddjob.svg?branch=master)](https://travis-ci.org/bodgit/puppet-oddjob)
[![Coverage Status](https://coveralls.io/repos/bodgit/puppet-oddjob/badge.svg?branch=master&service=github)](https://coveralls.io/github/bodgit/puppet-oddjob?branch=master)
[![Puppet Forge](http://img.shields.io/puppetforge/v/bodgit/oddjob.svg)](https://forge.puppetlabs.com/bodgit/oddjob)
[![Dependency Status](https://gemnasium.com/bodgit/puppet-oddjob.svg)](https://gemnasium.com/bodgit/puppet-oddjob)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with oddjob](#setup)
    * [What oddjob affects](#what-oddjob-affects)
    * [Beginning with oddjob](#beginning-with-oddjob)
4. [Usage - Configuration options and additional functionality](#usage)
    * [Classes and Defined Types](#classes-and-defined-types)
        * [Class: oddjob](#class-oddjob)
        * [Class: oddjob::mkhomedir](#class-oddjobmkhomedir)
        * [Defined Type: oddjob::helper](#defined-type-oddjobhelper)
    * [Examples](#examples)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module manages oddjob, a D-Bus service which performs random tasks.

## Module Description

This module installs and manages the oddjob D-Bus service and the mkhomedir
oddjob helper.

## Setup

### What oddjob affects

* The package(s) containing the oddjob software.
* The service controlling the oddjob daemon.
* Configuration for adding oddjob to the D-Bus system bus.

### Beginning with oddjob

```puppet
include ::dbus
include ::oddjob
```

## Usage

### Classes and Defined Types

#### Class: `oddjob`

**Parameters within `oddjob`:**

##### `conf_dir`

The configuration directory for helpers, usually `/etc/oddjob.conf.d`.

##### `package_name`

The name of the package to install that provides the oddjob software.

##### `service_name`

The name of the service managing the `oddjobd` daemon.

#### Class: `oddjob::mkhomedir`

**Parameters within `oddjob::mkhomedir`:**

##### `package_name`

The name of the package to install that provides the oddjob mkhomedir helper.

#### Defined Type: `oddjob::helper`

**Parameters within `oddjob::helper`:**

##### `content`

The contents of the oddjob helper configuration file.

##### `dbus_content`

The optional contents of a D-Bus system bus configuration file.

##### `name`

The name will be used to construct the filename for the helper configuration
file of the form `${system_dir}/oddjobd-${name}.conf`. If a D-Bus system bus
configuration file is desired the filename will be of the form
`oddjob-${name}.conf` usually under `/etc/dbus-1/system.d`.

### Examples

To install and enable the mkhomedir oddjob helper:

```puppet
include ::dbus
include ::oddjob
include ::oddjob::mkhomedir
```

It's then necessary to enable the `pam_oddjob_mkhomedir.so` PAM module somehow,
which can require `Class[::oddjob::mkhomedir]` as a dependency.

## Reference

### Classes

#### Public Classes

* [`oddjob`](#class-oddjob): Main class for installing the oddjob software.
* [`oddjob::mkhomedir`](#class-oddjobmkhomedir): Main class for installing the
  mkhomedir oddjob helper.

#### Private Classes

* `oddjob::config`: Handles oddjob configuration.
* `oddjob::install`: Handles oddjob installation.
* `oddjob::params`: Different configuration data for different systems.
* `oddjob::service`: Handles starting the oddjobd daemon.
* `oddjob::mkhomedir::config`: Handles mkhomedir oddjob helper configuration.
* `oddjob::mkhomedir::install`: Handles mkhomedir oddjob helper installation.

### Defined Types

#### Public Defined Types

* [`oddjob::helper`](#defined-type-oddjobhelper): Installs per-helper
  configuration and optionally D-Bus system bus configuration.

## Limitations

This module has been built on and tested against Puppet 3.0 and higher.

The module has been tested on:

* RedHat/CentOS Enterprise Linux 6/7

Testing on other platforms has been light and cannot be guaranteed.

## Development

Please log issues or pull requests at
[github](https://github.com/bodgit/puppet-oddjob).
