# @summary Install and configure Grafana Alloy
#
# @param config
#   The contents of the configuration file, if any
#
# @param manage_package_repo Installs the package repositories
#
# @example To customize the Alloy configuration, you can use the `config` parameter
# classes:
#   - grafana_alloy
#
# grafana_alloy::config: |
#   // Logging
#   logging {
#     level = "warn"
#   }
#
#   prometheus.exporter.unix "default" {
#     include_exporter_metrics = true
#     disable_collectors       = ["mdadm"]
#   }
#
#   // Prometheus scrape
#   prometheus.scrape "default" {
#     targets = array.concat(
#       prometheus.exporter.unix.default.targets,
#       [{
#         // Self-collect metrics
#         job         = "alloy",
#         __address__ = "%{facts.networking.ip}:12345",
#       }],
#     )
#     scrape_interval = "30s"
#     forward_to = [prometheus.remote_write.mimir.receiver]
#   }
#
#   // Remote write to Mimir
#   prometheus.remote_write "mimir" {
#     endpoint {
#       url = "https://mimir.example.com/api/v1/push"
#       headers = {
#         "X-Scope-OrgID" = "%{::environment}",
#       }
#     }
#   }
# @example If you want to pass arguments to the run commands, you can add the following content into your hieradata file:
# classes:
#   - grafana_alloy
#
# grafana_alloy::config::custom_args:
#   - "--server.http.listen-addr=%{facts.networking.ip}:12345"
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
