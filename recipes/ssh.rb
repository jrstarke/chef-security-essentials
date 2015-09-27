# Set up properties for SSH
node.default['openssh']['server']['permit_root_login'] = node['security_essentials']['ssh']['permit_root_login'] ? 'yes' : 'no'
node.default['openssh']['server']['password_authentication'] = node['security_essentials']['ssh']['password_authentication'] ? 'yes' : 'no'

if node['security_essentials']['ssh']['allow_sysadmins']
	node.default['openssh']['server']['match']['Group sysadmin']['AllowUsers'] = '*'
end

# Configure SSH to disable restrict access
include_recipe "openssh"
