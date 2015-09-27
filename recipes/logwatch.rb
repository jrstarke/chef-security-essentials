# Convenience for setting a single email address for notifications
if node['security_essentials']['mail']
	node.default['logwatch']['email'] = node['security_essentials']['mail']
end

# Setup log notifications
node.default['logwatch']['output'] = "mail"
node.default['logwatch']['detail'] = "high"

# Configure log notifications
include_recipe "logwatch"			
