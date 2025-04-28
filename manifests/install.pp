# @summary Install the Alloy package
#
# @api private
class grafana_alloy::install () {
  assert_private()

  package { 'alloy': }
}
