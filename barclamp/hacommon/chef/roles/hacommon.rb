name "hacommon"
description "HaCommon Openstack Role"
run_list(
     "recipe[apt]",
     "recipe[mysql::client]",
     "recipe[openstack-common]",
     "recipe[openstack-common::manage_encrypted_db]"
)
default_attributes()
override_attributes()
