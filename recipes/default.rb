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

if node['security_essentials']['features']['fail2ban']
	include_recipe "security-essentials::fail2ban"
end

if node['security_essentials']['features']['users']
	include_recipe "security-essentials::users"
end

if node['security_essentials']['features']['ssh']
	include_recipe "security-essentials::ssh"
end

if node['security_essentials']['features']['firewall']
	include_recipe "security-essentials::firewall"
end

if node['security_essentials']['features']['security_updates']
	include_recipe "security-essentials::security-updates"
end

if node['security_essentials']['features']['logwatch']
	include_recipe "security-essentials::logwatch"
end
