# 0.4.0

Added fail2ban, because it wasn't actually set up before

# 0.3.0

Added the ability to flag specific asspects of the cookbook off.

# 0.2.1

Locked the version of firewall, because ufw still uses the :enable resource, but firewall now 
uses install

# 0.1.1

Minor change to the placement of the convenience email setup, to fix upstream defaults.

# 0.1.0

Initial release of chef-security-essentials. 

Features:

* fail2ban
* sysadmin users and group
* openssh restrictions
* basic firewall
* unattended upgrades
* log notifications
