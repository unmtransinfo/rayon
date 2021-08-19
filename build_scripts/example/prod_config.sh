#!/usr/bin/env bash
#
# These defs are for a production instance.
#
${root}/bin/rayon_env rayon config user_config_path ~/.rayon-prod
${root}/bin/rayon_env rayon config secret_key $LRX_SECRET_KEY
${root}/bin/rayon_env rayon config rc_user $LRX_USER
${root}/bin/rayon_env rayon config rc_group $LRX_GROUP
${root}/bin/rayon_env rayon config host $LRX_PROD_IP
${root}/bin/rayon_env rayon config nginx_server_name $LRX_PROD_HOSTNAME
${root}/bin/rayon_env rayon config sentry_dsn $LRX_SENTRY_DSN
${root}/bin/rayon_env rayon config crashmail_email $LRX_CRASHMAIL_EMAIL
