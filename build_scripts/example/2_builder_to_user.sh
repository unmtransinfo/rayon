#!/usr/bin/env bash
set -e
if [ -z "$RAYON_BUILD_DIR" ]; then
   echo "You must source the defs script first."
   exit 1
fi
#
# Blow away directories owned by RYN_INSTALLER that
# should be owned by RYN_USER.
#
dirlist=("$RYN_TMP"
         "$RYN_LOG/*"
)
for dir in "${dirlist[@]}" ; do
  echo "removing $dir"
  rm -rf  $dir
done
#
echo "cp of var to $RYN_USER"
mv ${RYN_VAR} ${RYN_VAR}.${RYN_INSTALLER}
$RYN_SUDO -u $RYN_USER  mkdir ${RYN_VAR}
$RYN_SUDO -u $RYN_USER cp -R ${RYN_VAR}.${RYN_INSTALLER}/ ${RYN_VAR}
rm -r ${RYN_VAR}.${RYN_INSTALLER}
#
echo "loading model data"
$RYN_SUDO -u $RYN_USER cp -R ${RYN_SCRIPT_DIR}/data/ ${RYN_VAR}/data
#
echo "testing as $RYN_USER"
$RYN_SUDO -u $RYN_USER ${RYN_ROOT}/bin/rayon_env -v start
cd $RAYON_TEST_DIR
./test_targets.sh
$RYN_SUDO -u $RYN_USER ${RYN_ROOT}/bin/rayon_env -v stop
echo "Done testing as $RYN_USER"
