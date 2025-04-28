# @summary Manage the Alloy service
#
# @api private
class grafana_alloy::service () {
  assert_private()

  service { 'alloy':
    ensure => 'running',
    enable => true,
  }
}
