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

# Setup update notification emails
default['security_essentials']['features']['fail2ban'] = true
default['security_essentials']['features']['users'] = true
default['security_essentials']['features']['ssh'] = true
default['security_essentials']['features']['firewall'] = true
default['security_essentials']['features']['security_updates'] = true
default['security_essentials']['features']['logwatch'] = true

default['security_essentials']['mail'] = nil

default['security_essentials']['ssh']['permit_root_login'] = false
default['security_essentials']['ssh']['password_authentication'] = false
default['security_essentials']['ssh']['allow_sysadmins'] = true

default['security_essentials']['firewall']['rules'] = [
    {"allow ssh" => {
        "port" => "22"
        }
    }
]

default['security_essentials']['security_updates']['update_interval'] = '1'
default['security_essentials']['security_updates']['download_upgradable_interval'] = '1'
default['security_essentials']['security_updates']['autoclean_interval'] = '7'
default['security_essentials']['security_updates']['unattended_upgrade_interval'] = '1'

default['security_essentials']['logwatch']['output'] = "mail"
default['security_essentials']['logwatch']['detail'] = "high"
