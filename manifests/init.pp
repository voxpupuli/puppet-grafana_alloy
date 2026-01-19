# @summary Install and configure Grafana Alloy
#
# @param config
#   The contents of the configuration file, if any
# @param manage_package_repo
#   Installs the package repositories
# @param version
#   The specific version of the `alloy` package to install.
#   This can be a distro specific package version string, or a string such as `latest` etc.
class grafana_alloy (
  Optional[Variant[String[1], Sensitive[String[1]]]] $config = undef,
  Boolean $manage_package_repo = true,
  String[1] $version = 'installed',
) {
  if $grafana_alloy::manage_package_repo {
    contain grafana_alloy::repo
    Class['grafana_alloy::repo'] -> Class['grafana_alloy::install']
  }
  contain grafana_alloy::install

  class { 'grafana_alloy::config':
    config => $config,
  }

  contain grafana_alloy::service

  Class['grafana_alloy::install'] -> Class['grafana_alloy::config'] ~> Class['grafana_alloy::service']
}
