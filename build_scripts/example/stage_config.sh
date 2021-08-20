#!/usr/bin/env bash
#
# These defs are for use on a staging instance.
#
${root}/bin/rayon_env rayon config user_config_path ~/.rayon-stage
${root}/bin/rayon_env rayon config secret_key $RYN_SECRET_KEY
${root}/bin/rayon_env rayon config rc_user $RYN_USER
${root}/bin/rayon_env rayon config rc_group $RYN_GROUP
${root}/bin/rayon_env rayon config host $RYN_STAGE_IP
${root}/bin/rayon_env rayon config nginx_server_name $RYN_STAGE_HOSTNAME
${root}/bin/rayon_env rayon config sentry_dsn $RYN_SENTRY_DSN
${root}/bin/rayon_env rayon config crashmail_email $RYN_CRASHMAIL_EMAIL
