# puppet-dconf
Puppet Module to manage dconf settings with puppet. It updates the dconf database after edit the settings. 

## usage
first include dconf to setup the enviorment
```puppet
include dconf
```

Than you able to apply diffrent profiles
```puppet
dconf::profile{'gdm-example': }
```

This deploy the files to the clients.


Only tested with ubuntu.

More Information about dconf here:
https://help.gnome.org/admin/system-admin-guide/stable/user-settings.html.en
