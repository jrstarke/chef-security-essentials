# Convenience for setting a single email address for notifications
if node['security_essentials']['mail']
	node.default['apt_periodic']['unattended_upgrades']['mail'] = node['security_essentials']['mail']
end

# Set up automatic security updates
node.default['apt_periodic']['update_interval'] = node['security_essentials']['security_updates']['update_interval']
node.default['apt_periodic']['download_upgradeable_interval'] = node['security_essentials']['security_updates']['download_upgradable_interval']
node.default['apt_periodic']['autoclean_interval'] = node['security_essentials']['security_updates']['autoclean_interval']
node.default['apt_periodic']['unattended_upgrade_interval'] = node['security_essentials']['security_updates']['unattended_upgrade_interval']

# Configure automatic security updates
include_recipe "apt-periodic"
