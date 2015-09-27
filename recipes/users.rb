# Include the LWRP and create the basic sysadmins group
include_recipe "users"
include_recipe "users::sysadmins"

# Set the sysadmins group to have sudo privileges
include_recipe "sudo"