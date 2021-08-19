#!/usr/bin/env bash
#
# These defs are for use on a development instance.
#
${root}/bin/rayon_env rayon config user_config_path ~/.rayon-dev
${root}/bin/rayon_env rayon config secret_key $LRX_SECRET_KEY
${root}/bin/rayon_env rayon config rc_user $LRX_USER
${root}/bin/rayon_env rayon config rc_group $LRX_GROUP
${root}/bin/rayon_env rayon config rc_verbose True
${root}/bin/rayon_env rayon config host $LRX_DEV_IP
${root}/bin/rayon_env rayon config nginx_server_name $LRX_DEV_HOSTNAME
