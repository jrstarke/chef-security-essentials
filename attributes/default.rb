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

normal['firewall']['default_ssh_rule'] = false
default['firewall']['rules'] = [
    {"allow ssh" => {
        "port" => "22"
        }
    }
]

# Set up properties for SSH
normal['openssh']['server']['permit_root_login'] = 'no'
normal['openssh']['server']['password_authentication'] = 'no'
normal['openssh']['server']['match']['Group sysadmin']['AllowUsers'] = '*'

# Setup update notification emails
default['security_essentials']['mail'] = nil

# Set up automatic security updates
normal['apt_periodic']['update_interval'] = "1"
normal['apt_periodic']['download_upgradeable_interval'] = "1"
normal['apt_periodic']['autoclean_interval'] = "7"
normal['apt_periodic']['unattended_upgrade_interval'] = "1"

# Setup log notifications
normal['logwatch']['output'] = "mail"
normal['logwatch']['detail'] = "high"
