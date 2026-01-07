# Grafana Alloy module for Puppet

[![Build Status](https://github.com/voxpupuli/puppet-grafana_alloy/workflows/CI/badge.svg)](https://github.com/voxpupuli/puppet-grafana_alloy/actions?query=workflow%3ACI)
[![Release](https://github.com/voxpupuli/puppet-grafana_alloy/actions/workflows/release.yml/badge.svg)](https://github.com/voxpupuli/puppet-grafana_alloy/actions/workflows/release.yml)
[![Puppet Forge](https://img.shields.io/puppetforge/v/puppet/grafana_alloy.svg)](https://forge.puppetlabs.com/puppet/grafana_alloy)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/puppet/grafana_alloy.svg)](https://forge.puppetlabs.com/puppet/grafana_alloy)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/puppet/grafana_alloy.svg)](https://forge.puppetlabs.com/puppet/grafana_alloy)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/puppet/grafana_alloy.svg)](https://forge.puppetlabs.com/puppet/grafana_alloy)
[![puppetmodule.info docs](http://www.puppetmodule.info/images/badge.png)](http://www.puppetmodule.info/m/puppet-grafana_alloy)
[![MIT License](https://img.shields.io/github/license/voxpupuli/puppet-grafana_alloy.svg)](LICENSE)

[[_TOC_]]

* [Description](#description)
* [License](#license)
* [Usage](#usage)
* [Reference](#reference)
* [Authors](#authors)

## Description

This module configures the [Grafana Alloy](https://grafana.com/docs/alloy/latest/) service.

## Usage
To use this module, you need to include the main class either via puppet or hieradata.
```puppet
include grafana_alloy
```

hieradata example:
```yaml
---
classes:
  - grafana_alloy
```

## Reference
See the [REFERENCE.md](./REFERENCE.md) file
Feel free to take a look :
* [here](https://grafana.com/docs/alloy/latest/collect/choose-component/)
* [there](https://grafana.com/docs/alloy/latest/monitor/monitor-linux/)

## License

This project is licensed under the MIT license. A license file is in the document root of this repository.

## Authors

puppet-grafana_alloy is maintained by [Vox Pupuli](https://voxpupuli.org), it was written by [Evgeni Golov](https://github.com/evgeni).
