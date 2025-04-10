# @summary Install and configure Grafana Alloy
class grafana_alloy (
) {
  require grafana_alloy::repo
  package { 'alloy': }
  -> service { 'alloy':
    ensure => 'running',
    enable => true,
  }
}
