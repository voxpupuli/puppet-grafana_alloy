# @summary Configure the Alloy service
#
# @param config
#   This param let you adapt the Alloy configuration by passing parameters in yaml format
#
# @param custom_args
#   This param let you pass some arguments to the run commands
#
# @api private
class grafana_alloy::config (
  Optional[Variant[String[1],Sensitive[String[1]]]] $config = undef,
  Optional[Array[String[1]]] $custom_args = undef,
) {
  assert_private()

  $config_path = '/etc/alloy/config.alloy'
  $env_file  = $facts['os']['name'] ? {
    'Debian' => '/etc/default/alloy',
    'Ubuntu' => '/etc/default/alloy',
    default  => '/etc/sysconfig/alloy',
  }

  if $config {
    file { $config_path:
      content => $config,
      mode    => '0640',
      owner   => 'root',
      group   => 'alloy',
    }
  }

  $custom_args_str = $custom_args ? {
    undef   => '',
    default => "\"${custom_args.join(' ')}\"",
  }

  file_line { 'set_alloy_custom_args':
    path  => $env_file,
    match => '^CUSTOM_ARGS=',
    line  => "CUSTOM_ARGS=${custom_args_str}",
  }
}
