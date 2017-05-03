#packages installation
$packages = ['iptables','apt','ntp','htop','iotop','tcpdump','git','wget','vim','sysstat']
package { $packages: ensure => 'installed'}

#manage iptables
class { 'rad-firewallrules::rules': }
class { 'rad-user::user': }
class { 'rad-ssh::ssh': }
class {'rad-motd::motd': }
