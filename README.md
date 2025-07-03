# Grafana Alloy module for Puppet

[![Build Status](https://github.com/voxpupuli/puppet-grafana_alloy/workflows/CI/badge.svg)](https://github.com/voxpupuli/puppet-grafana_alloy/actions?query=workflow%3ACI)
[![Release](https://github.com/voxpupuli/puppet-grafana_alloy/actions/workflows/release.yml/badge.svg)](https://github.com/voxpupuli/puppet-grafana_alloy/actions/workflows/release.yml)
[![Puppet Forge](https://img.shields.io/puppetforge/v/puppet/grafana_alloy.svg)](https://forge.puppetlabs.com/puppet/grafana_alloy)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/puppet/grafana_alloy.svg)](https://forge.puppetlabs.com/puppet/grafana_alloy)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/puppet/grafana_alloy.svg)](https://forge.puppetlabs.com/puppet/grafana_alloy)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/puppet/grafana_alloy.svg)](https://forge.puppetlabs.com/puppet/grafana_alloy)
[![puppetmodule.info docs](http://www.puppetmodule.info/images/badge.png)](http://www.puppetmodule.info/m/puppet-grafana_alloy)
[![MIT License](https://img.shields.io/github/license/voxpupuli/puppet-grafana_alloy.svg)](LICENSE)

## ToC

* [Description](#description)
* [License](#license)
* [Usage](#usage)
  * [Tuning Configuration](#tuning-configuration)
* [Authors](#authors)

## Description

This module configures the [Grafana Alloy](https://grafana.com/docs/alloy/latest/) service.

## Usage
To use that module, you need to call the main class either via puppet :
```puppet
include grafana_alloy
```
either
```puppet
---
classes:
  - grafana_alloy
```

### Tuning configuration
If you want to adapt the Alloy configuration you can use the `config` variable like this (into hiera declaration file):

```puppet
grafana_alloy::config:
  // Logging
  logging {
    level = "warn"
  }
```
Feel free to take a look [here](https://grafana.com/docs/alloy/latest/collect/choose-component/) and [there](https://grafana.com/docs/alloy/latest/monitor/monitor-linux/)


If you want to pass arguments to the run commands, you can add the following content into your hieradata file:
```puppet
grafana_alloy::config::custom_args:
  - "--server.http.listen-addr=%{facts.networking.ip}:12345"
  - "--stability.level=public-preview"
```
## License

This project is licensed under the MIT license. A license file is in the document root of this repository.

## Authors

puppet-grafana_alloy is maintained by [Vox Pupuli](https://voxpupuli.org), it was written by [Evgeni Golov](https://github.com/evgeni).
