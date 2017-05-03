class rad-user::user {
  user { 'puppetuser':
    ensure => present,
    comment => 'puppet created test user',
    home => '/home/puppetuser',
    managehome => true,
    shell => '/bin/bash',
  }
  ssh_authorized_key { 'puppetuser_ssh':
    user => 'puppetuser',
    type => 'ssh-rsa',
    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDATgAExDCRgj/FgRfwd3jCYIAH04NoOaPP5Wfno97n1SP2YqanQiUQ8eHcTr6CfRhqA0pVsh57p7U0wZEqIoAqq9uLDRx4JFj2ksDvYw9hBK4ejcedjk5GTuUL61d2edClcUsgg+j1cSFeEe1qPPoHoaA8AkgjBAzGP+JDhEWPFrT6Ii22KT5BuZFm7kM1AtenD6eznKEHtCg9BpTSpIPlLLDuFeS7OBKo9aDMZ8bR7mcQmYRAH0yJS2JYdsJWaN2997UspJ1dtvvmTmCzg7w6K1c7TiLprf+Ccq+UiRiPSagsnFUIsIvR+3wyuSiB/f99D9UTkdHEcaTq4SI/i567',
  }
  sudo::conf { 'puppetuser':
    priority => 10,
    content  => 'puppetuser ALL=(ALL) NOPASSWD: ALL',
  }
}
