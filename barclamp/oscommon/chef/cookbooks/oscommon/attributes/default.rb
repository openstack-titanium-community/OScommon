#
# Cookbook Name:: openstack-common
# Attributes:: default
#
# Copyright 2012-2013, AT&T Services, Inc.
# Copyright 2013, SUSE Linux GmbH
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# ========================= Passwords - keep all this stuff together so it's easy to access or replace with a databag (JPA) ======================
# Keystone passwords/tokens
default["identity"]["db"]["password"] = "keystone"
default["openstack"]["identity"]["admin_user_password"] = "adminpassword"
default["openstack"]["identity"]["openstack_identity_bootstrap_token"] = "ADMIN"

# Percona/MySQL passwords
default["mysql"]["root_password"] = "Password12"
default["mysql"]["debian_user_password"] = "Password12"
# =================================================================================================================================================

# Setting this to True means that database passwords and service user
# passwords for Keystone will be easy-to-remember values -- they will be
# the same value as the key. For instance, if a cookbook calls the
# ::Openstack::secret routine like so:
#
# pass = secret "passwords", "nova"
#
# The value of pass will be "nova"
# default is false - changed by JPA
default["openstack"]["developer_mode"] = true

# The type of token signing to use (uuid or pki)
default["openstack"]["auth"]["strategy"] = "uuid"

# Set to true where using self-signed certs (in testing environments)
default["openstack"]["auth"]["validate_certs"] = true

# ========================= Package and Repository Setup ======================
#
# Various Linux distributions provide OpenStack packages and repositories.
# The provide some sensible defaults, but feel free to override per your
# needs.

# The coordinated release of OpenStack codename
default["openstack"]["release"] = "grizzly"

# The Ubuntu Cloud Archive has packages for multiple Ubuntu releases. For
# more information, see: https://wiki.ubuntu.com/ServerTeam/CloudArchive.
# In the component strings, %codename% will be replaced by the value of
# the node["lsb"]["codename"] Ohai value and %release% will be replaced
# by the value of node["openstack"]["release"]
default["openstack"]["apt"]["uri"] = "http://ubuntu-cloud.archive.canonical.com/ubuntu"
default["openstack"]["apt"]["components"] = [ "precise-updates/grizzly", "main" ]
# For the SRU packaging, use this:
# default["openstack"]["apt"]["components"] = [ "%codename%-proposed/%release%", "main" ]

default["openstack"]["zypp"]["repo-key"] = "05F4861F"  # 32 bit key ID
default["openstack"]["zypp"]["uri"] = "http://download.opensuse.org/repositories/Cloud:/OpenStack:/%release%/%suse-release%/"

#TODO(jaypipes): Do RHEL/Fedora platform family YUM setup

# ======================== OpenStack DB Support ================================

# Default database attributes
#default["openstack"]["mq"]["server_role"] = "os-ops-messaging"
#default["openstack"]["mq"]["service_type"] = "rabbitmq"
#default["openstack"]["mq"]["port"] = "5672"
#default["openstack"]["mq"]["user"] = "guest"
#default["openstack"]["mq"]["vhost"] = "/"
