# @summary Configure the Alloy service
#
# @api private
class grafana_alloy::config (
  Optional[Variant[String[1],Sensitive[String[1]]]] $config = undef,
  Optional[Array[String[1]]] $custom_args = undef,
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

  if $facts['os']['name'] == 'Debian' {
    if $custom_args {
      $custom_args_str = "\"${custom_args.join(' ')}\""
    }
    else {
      $custom_args_str = ''
    }
    file_line { 'set_alloy_custom_args':
      path  => '/etc/default/alloy',
      match => '^CUSTOM_ARGS=',
      line  => "CUSTOM_ARGS=${custom_args_str}",
    }
  }
}
