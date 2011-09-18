File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd':
     content => "Welcome to your PHP build test instance.
                 Managed by Vagrant and Puppet.\n"
}

package { "subversion" :
  ensure => 'installed',
}

vcsrepo { "/home/vagrant/php-5.3":
   require => Package["subversion"],
   ensure => present,
   provider => svn, 
   owner => "vagrant",
   source => 'https://svn.php.net/repository/php/php-src/branches/PHP_5_3',
}

vcsrepo { "/home/vagrant/php-5.4":
   require => Package["subversion"],
   ensure => present,
   provider => svn, 
   owner => "vagrant",
   source => 'https://svn.php.net/repository/php/php-src/branches/PHP_5_4',
}   

vcsrepo { "/home/vagrant/php-head":
   require => Package["subversion"],
   ensure => present,
   provider => svn, 
   owner => "vagrant",
   source => 'https://svn.php.net/repository/php/php-src/trunk',
}

# buildconf dependencies
package { ["autoconf2.59", "libtool"]:
  ensure => present,
}

# minimal build dependencies
package { ["gcc", "flex", "bison", "re2c", "lemon", "libxml2-dev"]:
  ensure => present,
}

# environment settings needed for building PHP
file { "/home/vagrant/.bash_aliases":
  content => "export PHP_AUTOCONF=autoconf2.59",
  owner   => "vagrant",
}  
