# @summary Configure the Alloy service
#
# @param config
#   This param let you adapt the Alloy configuration by passing parameters in yaml format
#
# @param custom_args
#   This param let you pass some arguments to the run commands
#
# @param path
#   This param define environment variables e.g. CUSTOM_args
#
# @api private
class grafana_alloy::config (
  Optional[Variant[String[1],Sensitive[String[1]]]] $config = undef,
  Optional[Array[String[1]]] $custom_args = undef,
  Optional[Array[String[1]]] $path = undef,
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
    $path = '/etc/default/alloy'
  }
  elsif $facts['os']['name'] == 'RedHat' {
    $path = '/etc/sysconfig/alloy'
  }

  if !empty($custom_args) {
    $custom_args_str = "\"${custom_args.join(' ')}\""
  }
  else {
    $custom_args_str = ''
  }
  file_line { 'set_alloy_custom_args':
    path  => $path,
    match => '^CUSTOM_ARGS=',
    line  => "CUSTOM_ARGS=${custom_args_str}",
  }
}
