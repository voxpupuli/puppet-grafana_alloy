# @summary Configure Grafana repo
class grafana_alloy::repo (
  Optional[String] $apt_key_id = undef,
) {
  case $facts['os']['family'] {
    'RedHat': {
      yumrepo { 'grafana-alloy':
        descr    => 'Grafana Alloy',
        baseurl  => 'https://rpm.grafana.com',
        gpgcheck => '1',
        gpgkey   => 'https://rpm.grafana.com/gpg.key',
        enabled  => '1',
      }
    }
    'Debian': {
      include apt

      apt::source { 'grafana-alloy':
        release  => 'stable',
        repos    => 'main',
        location => 'https://apt.grafana.com',
        include  => {
          src => false,
        },
        key      => {
          id       => $apt_key_id,
          name     => 'grafana-alloy',
          filename => 'grafana-alloy.asc',
          source   => 'https://apt.grafana.com/gpg.key',
        },
      }
    }
    default: {
      fail("${facts['networking']['hostname']}: This module does not support osfamily ${facts['os']['family']}")
    }
  }
}
