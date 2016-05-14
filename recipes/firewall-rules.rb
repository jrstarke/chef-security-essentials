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

firewall_rules = []

node['security_essentials']['firewall']['rule_definitions'].each do | protocol_key, rule |
  if node['security_essentials']['firewall']['open'].include?(protocol_key)
    firewall_rules.push(rule)
  end
end

node.default['security_essentials']['firewall']['rules'] = firewall_rules
