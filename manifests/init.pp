# @summary Install and configure Grafana Alloy
#
# @param config
#   The contents of the configuration file, if any
class grafana_alloy (
  Optional[String[1]] $config = undef,
) {
  contain grafana_alloy::repo
  contain grafana_alloy::install

  class { 'grafana_alloy::config':
    config => $config,
  }

  contain grafana_alloy::service

  Class['grafana_alloy::repo'] -> Class['grafana_alloy::install'] -> Class['grafana_alloy::config'] ~> Class['grafana_alloy::service']
}
