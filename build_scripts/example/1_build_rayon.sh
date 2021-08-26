#!/usr/bin/env bash
#
# starting from clean empty directory
#
set -e
if [ -z "$RAYON_BUILD_DIR" ]; then
   echo "You must source the defs script first."
   exit 1
fi
repo_url="https://raw.githubusercontent.com/unmtransinfo/rayon/master"
# get environmental script
mkdir -p $RYN_SCRIPT_DIR
curl -L -o rayon_tool ${repo_url}/rayon/bin/server_env.sh
mv server_env.sh rayon_env
chmod 755 rayon_env
# get build tool
mkdir -p $RAYON_BUILD_DIR
cd $RAYON_BUILD_DIR
curl -L -o rayon_tool ${repo_url}/build_scripts/rayon_tool.sh
chmod 755 rayon_tool
ln -s ${RYN_SCRIPT_DIR}/my_build.sh .
ln -s ${RYN_SCRIPT_DIR}/${RYN_STAGE}_config.sh ./my_config.sh
./rayon_tool build -y
./rayon_tool configure_pkg -y
./rayon_tool testify -y
echo "If you see this line, you can be quite sure that rayon is properly installed as ${RYN_INSTALLER}."
