# @summary Configure the Alloy service
#
# @api private
class grafana_alloy::config (
  Optional[Variant[String[1],Sensitive[String[1]]]] $config = undef,
) {
  assert_private()

  if $config {
    file { '/etc/alloy/config.alloy':
      content => $config,
      mode    => '0640',
      owner   => 'root',
      group   => 'alloy',
    }
  }
}
