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

default['security_essentials']['firewall']['open'] = ['ssh']

default['security_essentials']['firewall']['rule_definitions']['ssh'] = {
	"ssh" => {
		"port" => "22"
	}
}

default['security_essentials']['firewall']['rule_definitions']['zerotier'] = {
	"zerotier" => {
		"port" => "9993",
		"protocol"=> "udp"
	}
}

default['security_essentials']['firewall']['rule_definitions']['http'] = {
	"http" => {
		"port" => "80"
	}
}

default['security_essentials']['firewall']['rule_definitions']['https'] = {
	"https" => {
		"port" => "443"
	}
}

default['security_essentials']['firewall']['rule_definitions']['mongo'] = {
	"mongo" => {
		"port" => "27017"
	}
}

default['security_essentials']['firewall']['rule_definitions']['redis'] = {
	"redis" => {
		"port" => "6379"
	}
}
