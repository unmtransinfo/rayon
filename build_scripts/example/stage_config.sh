#!/usr/bin/env bash
#
# These defs are for use on a staging instance.
#
${root}/bin/rayon_env rayon config user_config_path ~/.rayon-stage
${root}/bin/rayon_env rayon config secret_key $LRX_SECRET_KEY
${root}/bin/rayon_env rayon config rc_user $LRX_USER
${root}/bin/rayon_env rayon config rc_group $LRX_GROUP
${root}/bin/rayon_env rayon config host $LRX_STAGE_IP
${root}/bin/rayon_env rayon config nginx_server_name $LRX_STAGE_HOSTNAME
${root}/bin/rayon_env rayon config sentry_dsn $LRX_SENTRY_DSN
${root}/bin/rayon_env rayon config crashmail_email $LRX_CRASHMAIL_EMAIL
