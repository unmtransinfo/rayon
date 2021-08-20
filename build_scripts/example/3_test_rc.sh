#!/usr/bin/env bash
set -e
error_exit() {
  >&2 echo "ERROR--unexpected exit from ${BASH_SOURCE} script at line:"
  >&2 echo "   $BASH_COMMAND"
  >&2 echo "This failure may have left a running server instance."
  >&2 echo "You should stop it with the command"
  >&2 echo "   \"sudo service rayon stop\"."
}
trap error_exit EXIT
sudo cp ${RYN_ROOT}/rayon-${RYN_VERSION}/etc/rc.d/rayon /usr/local/etc/rc.d/rayon
sudo chmod 555 /usr/local/etc/rc.d/rayon
sudo cp ${RYN_ROOT}/rayon-${RYN_VERSION}/etc/conf.d/rayon /etc/rc.conf.d/rayon
sudo chmod 555 /usr/local/etc/rc.d/rayon
echo "starting service..."
sudo service rayon start
echo "Stopping the service..."
sudo service rayon stop
trap - EXIT
