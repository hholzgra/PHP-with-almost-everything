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

### additional extensions

# bz2
package { ["libbz2-dev"]:
  ensure => present,
}

# curl
package { ["libcurl4-openssl-dev"]:
  ensure => present,
}

# dba
package { ["libgdbm-dev","libqdbm-dev","libcdb-dev"]:
  ensure => present,
}

# enchant
package { ["libenchant-dev"]:
  ensure => present,
}

# gd
package { ["libgd2-xpm-dev","libfontconfig1-dev","libfreetype6-dev"]:
  ensure => present,
}

# gmp
package { ["libgmp3-dev"]:
  ensure => present,
}

# imap
package { ["libc-client2007e-dev"]:
  ensure => present,
}

# interbase / firebird
package { ["firebird2.5-dev"]:
  ensure => present,
}

# ldap
package { ["libldap2-dev"]:
  ensure => present,
}

# mbstring ?
package { ["libicu-dev"]:
  ensure => present,
}

# mcrypt 
package { ["libmcrypt-dev"]:
  ensure => present,
}

# MS SQL
package { ["freetds-dev"]:
  ensure => present,
}

# mysql
package { ["libmysqlclient-dev"]:
  ensure => present,
}

# odbc
package { ["unixodbc-dev"]:
  ensure => present,
}

# openssl
package { ["libssl-dev"]:
  ensure => present,
} 

# postgresql
package { ["libpq-dev"]:
  ensure => present,
}

# pspell
package { ["libpspell-dev"]:
  ensure => present,
}

# readline 
package { ["libreadline-dev"]:
  ensure => present,
}

# recode
package { ["librecode-dev"]:
  ensure => present,
}

# snmp 
package { ["libsnmp-dev"]:
  ensure => present,
}

# tidy
package { ["libtidy-dev"]:
  ensure => present,
}

# wddx
package { ["libexpat1-dev"]:
  ensure => present,
}

# xslt
package { ["libxslt1-dev"]:
  ensure => present,
}

