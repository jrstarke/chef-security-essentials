chef-security-essentials Cookbook
=================================

Based on "[My First 5 Minutes On A Server; Or, Essentials Security for Linux Servers][1]" by Bryan Kennedy


Requirements
------------

### Platforms
- Ubuntu

Currently the [ufw][3] cookbook is only listed as having support for Ubuntu, and since this cookbook uses it, we can't do any better.


Dependencies
------------

* fail2ban
* users
* sudo
* openssh
* ufw

The *ufw* cookbook includes a rule for allowing SSH from any by default. If you would like the ability to disable this, or restrict it to specific IP range, you will want to include the following cookbook in your Berksfile.

`cookbook "ufw", github: 'jrstarke/ufw'`

If you are using chef-solo, you will want to be sure to include the `chef-solo-search` cookbook in your Berksfile, or downstream cookbook dependencies.

Fail2Ban
-----

This cookbook uses the defaults from the [fail2ban][4] cookbook, which include 5 fails over a 10 minute period, which would result in a 5 minute ip ban. This will significantly slow down any attacker trying to bruteforce their way into the server.


Users
-----

This cookbook uses the [users][2] cookbook to 
create the set of users and add them to the `sysadmin` group. But this requires a users data bag. See the [users][2]
cookbook for details on how to create these data bags.

The basics, create a data bag for the users.

`$ knife data bag create users`

You will also want to generate a password hash for the user.

`$ openssl passwd -1 "plaintextpassword"`

You can then create a particular user with 

`$ knife data bag create users username`

A sample data bag example is 

```
{
  "id": "bofh",
  "password": "$1$d...HgH0",
  "ssh_keys": [
    "ssh-rsa AAA123...xyz== foo",
    "ssh-rsa AAA456...uvw== bar"
  ],
  "groups": [
    "sysadmin"
  ],
  "shell": "\/bin\/bash"
}
```


SSH
---

By default, this cookbook will turn off **PermitRootLogin**, disable **PasswordAuthentication** and add allow access only to those in the **sysadmin** group (defined in **Users** above). 


UFW
---

Next you will want to configure your own firewall rules. By default we lock down everything but SSH (which we have restricted to only sysadmin users so far). If you want to disable or change the SSH rule, see the **ufw** section of the **requirements** above.

You can configure the firewall, using the instructions from [ufw][3]. A rule that will allow HTTP looks like:

```
node['firewall']['rules'] = [
  {"http" => {
    "port" => "80"
    }
  }
]
```

Upgrade and Log notifications
-----------------------------

This cookbook configures both Unattended Upgrades, and logwatch. Both of these support email notifications. To make configuring these easier, you can use the following node attribute, which will set both attributes:

`node['security_essentials']['mail'] = "your_email@example.com"`

This will use the same email address for both 


[1]: http://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers
[2]: https://github.com/opscode-cookbooks/users
[3]: https://github.com/opscode-cookbooks/ufw