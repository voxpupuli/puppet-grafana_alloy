# @summary Install and configure Grafana Alloy
#
# @param config
#   The contents of the configuration file, if any
#
# @param manage_package_repo Installs the package repositories
#
# @example To customize the Alloy configuration, you can use the `config` variable
#   class { 'grafana_alloy':
#     config => @("CONFIG"),
#       logging {
#         level = "warn"
#       }
#       |CONFIG
#   }
#
# @example If you want to pass arguments to the run commands, you can add the following content into your hieradata file:
#   class { 'grafana_alloy::config':
#     custom_args => [
#       "--server.http.listen-addr=${facts['networking']['ip']:12345",
#       "--stability.level=public-preview",
#     ],
#   }
class grafana_alloy (
  Optional[Variant[String[1], Sensitive[String[1]]]] $config = undef,
  Boolean $manage_package_repo = true,
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
