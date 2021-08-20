#!/usr/bin/env bash
#
# starting from clean empty directory
#
set -e
if [ -z "$RAYON_BUILD_DIR" ]; then
   echo "You must source the defs script first."
   exit 1
fi
error_exit() {
  >&2 echo "ERROR--unexpected exit from ${BASH_SOURCE} script at line:"
  >&2 echo "   $BASH_COMMAND"
}
trap error_exit EXIT
echo "Changing configuration to prod"
cd $RAYON_BUILD_DIR
rm my_config.sh
ln -s ${RYN_SCRIPT_DIR}/prod_config.sh ./my_config.sh
${RYN_ROOT}/bin/rayon_env rayon config --delete
pushd $RAYON_BUILD_DIR
./rayon_tool configure_pkg -y --no-init --no-var
popd
${RYN_ROOT}/bin/rayon_env rayon create_test_files --force --configonly
echo "Ready for move to production."
trap - EXIT
exit 0
