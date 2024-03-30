# Packer input variables for all builds.

##################################################################################
# VARIABLES
##################################################################################

# Credentials

 vcenter_username = "svc_unixiac@CSS.CGIPDC.CGINET"
 vcenter_password = "P@ssw0rd12345@@@"

build_username   = "cgiadmin"
build_password   = "P@ssw0rd"


# vSphere Objects

vcenter_insecure_connection     = true
vcenter_server                  = "phx-ctss-vcsa01.css.cgipdc.cginet"
vcenter_datacenter              = "PHX-CTSS"
vcenter_cluster                 = "INT-LINUX"
#vcenter_datastore               = "CGI-NAS-Templates"
vcenter_datastore               = "CGI-GTO-CTSS-CL0XE-08B9"
vcenter_network                 = "1495-Backup-Actifio"
vcenter_folder                  = "UnixIAC/VMTemplates/"
vcenter_content_library         = "PHX-CTSS Content Library"
vcenter_environment             = "PHX-CTSS"
#vcenter_resource_pool             = "EDITME"

# ISO Objects

iso_datastore = "[CGI-GTO-CTSS-CL0X-0140] " # The [SPACE] is required.
# iso_path      = "contentlib-eee7bb14-309a-4339-b116-06c0d986cf91/0da0307b-9ed8-4c65-91a0-8acf43d5b69f/"

