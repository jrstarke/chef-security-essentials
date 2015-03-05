#
# Cookbook Name:: chef-security-essentials
# Recipe:: default
#
# Copyright 2015,  Jamie Starke
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Based on the recommendations of Bryan Kennedy from his post
# http://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers

# Include the LWRP and create the basic sysadmins group
include_recipe "users"
include_recipe "users::sysadmins"

# Set the sysadmins group to have sudo privileges
include_recipe "sudo"

# Configure SSH to disable restrict access
include_recipe "openssh"

# Configure basic firewall with UFW
include_recipe "ufw"

# Configure automatic security updates
include_recipe "apt-periodic"

# Configure log notifications
include_recipe "logwatch"
