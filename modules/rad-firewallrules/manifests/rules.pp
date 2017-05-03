class rad-firewallrules::rules {
  
  Firewall {
    require => undef,
  }

  firewall { "000 accept all icmp":
    chain    => 'INPUT',
    proto    => icmp,
    action   => accept,
  }

  firewall { '001 accept all to lo interface':
    chain    => 'INPUT',
    proto    => 'all',
    iniface  => 'lo',
    action   => 'accept',
  }

  firewall { '003 accept related established rules':
    chain    => 'INPUT',
    proto    => 'all',
    state    => ['RELATED', 'ESTABLISHED'],
    action   => 'accept',
  }

  firewall { '004 accept related established rules':
    chain    => 'OUTPUT',
    proto    => 'all',
    state    => ['RELATED', 'ESTABLISHED'],
    action   => 'accept',
  }

  # extra
  firewall { '200 allow outgoing icmp type 8 (ping)':
    chain    => 'OUTPUT',
    proto    => 'icmp',
    icmp     => 'echo-request',
    action   => 'accept',
  }  
  
  firewall { '200 allow outgoing dns lookups':
    chain    => 'OUTPUT',
    state    => ['NEW'],
    dport    => '53',
    proto    => 'udp',
    action   => 'accept',
  }  
  
  firewall { '100 allow openssh':
    chain   => 'INPUT',
    state   => ['NEW'],
    dport   => '22',
    proto   => 'tcp',
    action  => 'accept',
  }
}
