# Set up the basic firewall properties
node.default['firewall']['default_ssh_rule'] = false
node.normal['firewall']['rules'] = node['security_essentials']['firewall']['rules']

log node.normal['firewall']['rules']

# Configure basic firewall with UFW
include_recipe "ufw"
