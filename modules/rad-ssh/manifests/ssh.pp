

class rad-ssh::ssh {
  class { 'ssh::server':
  storeconfigs_enabled => false,
  options => {
    'Match User www-data' => {
      'ChrootDirectory' => '%h',
      'ForceCommand' => 'internal-sftp',
      'PasswordAuthentication' => 'no',
      'AllowTcpForwarding' => 'yes',
      'X11Forwarding' => 'yes',
    },
    'PasswordAuthentication' => 'no',
    'PermitRootLogin'        => 'no',
    'Port'                   => 22,
  },
} 
}
