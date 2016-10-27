# $Id: $

class dconf {

  file { '/etc/dconf':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755';
  }

  file { '/etc/dconf/profile':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => File['/etc/dconf'];
  }

  file { '/etc/dconf/db':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => File['/etc/dconf'];
  }

  exec { 'dconf-update':
    refreshonly => true,
    command     => '/usr/bin/dconf update';
  }
}
