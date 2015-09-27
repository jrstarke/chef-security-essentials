name             'security-essentials'
maintainer       'Jamie Starke'
maintainer_email 'github@jamiestarke.com'
license          'Apache 2.0'
description      'Installs/Configures chef-security-essentials'
version          '0.1.3'

depends 'fail2ban', '~> 2.1.2'
depends 'users', '~> 1.7.0'
depends 'sudo', '~> 2.6.0'
depends 'openssh', '~> 1.3.4'
depends 'ufw', '~> 0.7.4'
depends 'apt-periodic', '~> 0.2.0'
depends 'logwatch', '~> 1.1.0'

%w{ ubuntu }.each do |os|
  supports os
end
