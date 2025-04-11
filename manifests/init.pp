# @summary Install and configure Grafana Alloy
#
# @param config
#   The contents of the configuration file, if any
class grafana_alloy (
  Optional[String[1]] $config = undef,
) {
  require grafana_alloy::repo
  package { 'alloy': }

  if $config {
    file { '/etc/alloy/config.alloy':
      content => $config,
      mode    => '0640',
      owner   => 'root',
      group   => 'alloy',
      require => Package['alloy'],
      notify  => Service['alloy'],
    }
  }

  service { 'alloy':
    ensure  => 'running',
    enable  => true,
    require => Package['alloy'],
  }
}
