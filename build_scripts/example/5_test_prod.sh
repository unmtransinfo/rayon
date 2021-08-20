#!/usr/bin/env bash
if [ -z "$RAYON_TEST_DIR" ]; then
  echo "ERROR--you must source the defs file before running this script."
  exit 1
fi
set -e
error_exit() {
  >&2 echo "ERROR--unexpected exit from ${BASH_SOURCE} script at line:"
  >&2 echo "   $BASH_COMMAND"
  >&2 echo "This failure may have left a running server instance."
  >&2 echo "You should stop it with the command"
  >&2 echo "   \"sudo service rayon stop\"."
}
echo "Testing production instance (not necessarily on this server)."
# Link to prod rayon config directory
rm -f ~/.rayon
ln -s ${RYN_INSTALLER_HOME}/.rayon-prod ~/.rayon
echo "testing service in $RAYON_TEST_DIR..."
pushd $RAYON_TEST_DIR
./test_targets.sh
popd 
trap - EXIT
echo "Tests completed successfully."
exit 0
