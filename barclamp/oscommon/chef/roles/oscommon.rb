name "oscommon"
description "OpenStack-Common Source files"
run_list(
        "recipe[oscommon::install]"
)
default_attributes()
override_attributes()
