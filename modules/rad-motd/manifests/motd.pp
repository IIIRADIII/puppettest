class rad-motd::motd {
    file { "/etc/motd":
        mode => "0644",
        owner => 'root',
        group => 'root',
        source => 'puppet:///modules/rad-motd/motd',
    }
}
