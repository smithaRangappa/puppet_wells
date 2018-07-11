class params:: {
  case $facts['os']['family'] {
    'Debian': {
      $package_name = 'openssh-server'
      $service_name = 'ssh'
      }
    'RedHat': {
      $package_name = 'openssh-server'
      $service_name = 'sshd'
      }
    default: {
      fail ("${facts['operatingsystem']} is not supported"0
      }
  }
}


===================
class shh(
  String $package_name = $::params::pacakge_name,
  String $service_name = $::params::service_name,
  ) inherits ::ssh::params {
  class { 'ssh::install':: } ->
  class { 'ssh::service':: }
}
