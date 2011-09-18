File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd':
     content => "Welcome to your PHP build test instance.
                 Managed by Vagrant and Puppet.\n"
}

