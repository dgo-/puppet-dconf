# $Id: $

define dconf::profile {

  if ($title == 'user') {
    file { '/etc/dconf/profile/user':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('dconf/profile.erb'),
      notify  => Exec['dconf-update'],
      require => File['/etc/dconf/profile'];
    }

    file { "/etc/dconf/db/${title}.d/":
      ensure  => 'directory',
      owner   => 'root',
      group   => 'root',
      recurse => true,
      mode    => '0755',
      source  => "puppet:///modules/dconf/${lsbdistcodename}",
      notify  => Exec['dconf-update'],
      require => File['/etc/dconf/db'];
    }
  } else {
    file { "/etc/dconf/profile/${title}":
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('dconf/profile.erb'),
      notify  => Exec['dconf-update'],
      require => File['/etc/dconf/profile'];
    }

    file { "/etc/dconf/db/${title}.d/":
      ensure  => 'directory',
      owner   => 'root',
      group   => 'root',
      recurse => true,
      mode    => '0755',
      source  => "puppet:///modules/dconf/${title}",
      notify  => Exec['dconf-update'],
      require => File['/etc/dconf/db'];
    }
  }
}
