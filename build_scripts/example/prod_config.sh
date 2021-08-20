#!/usr/bin/env bash
#
# These defs are for a production instance.
#
${root}/bin/rayon_env rayon config user_config_path ~/.rayon-prod
${root}/bin/rayon_env rayon config secret_key $RYN_SECRET_KEY
${root}/bin/rayon_env rayon config rc_user $RYN_USER
${root}/bin/rayon_env rayon config rc_group $RYN_GROUP
${root}/bin/rayon_env rayon config host $RYN_PROD_IP
${root}/bin/rayon_env rayon config nginx_server_name $RYN_PROD_HOSTNAME
${root}/bin/rayon_env rayon config sentry_dsn $RYN_SENTRY_DSN
${root}/bin/rayon_env rayon config crashmail_email $RYN_CRASHMAIL_EMAIL
${root}/bin/rayon_env rayon config tcrd_host tcrd.kmc.io
${root}/bin/rayon_env rayon config tcrd_user tcrd
${root}/bin/rayon_env rayon config tcrd_database tcrd6110
