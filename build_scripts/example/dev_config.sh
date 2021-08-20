#!/usr/bin/env bash
#
# These defs are for use on a development instance.
#
${root}/bin/rayon_env rayon config user_config_path ~/.rayon-dev
${root}/bin/rayon_env rayon config secret_key $RYN_SECRET_KEY
${root}/bin/rayon_env rayon config rc_user $RYN_USER
${root}/bin/rayon_env rayon config rc_group $RYN_GROUP
${root}/bin/rayon_env rayon config rc_verbose True
${root}/bin/rayon_env rayon config host $RYN_DEV_IP
${root}/bin/rayon_env rayon config nginx_server_name $RYN_DEV_HOSTNAME
