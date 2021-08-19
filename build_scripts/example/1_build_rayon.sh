#!/usr/bin/env bash
#
# starting from clean empty directory
#
set -e
if [ -z "$LORAX_BUILD_DIR" ]; then
   echo "You must source the defs script first."
   exit 1
fi
mkdir -p $LORAX_BUILD_DIR
cd $LORAX_BUILD_DIR
curl -L -o rayon_tool https://raw.githubusercontent.com/LegumeFederation/rayon/master/build_scripts/rayon_tool.sh
chmod 755 rayon_tool
ln -s ${LRX_SCRIPT_DIR}/my_build.sh .
ln -s ${LRX_SCRIPT_DIR}/${LRX_STAGE}_config.sh ./my_config.sh
./rayon_tool build -y
./rayon_tool configure_pkg -y
./rayon_tool testify -y
echo "If you see this line, you can be quite sure that rayon is properly installed as ${LRX_INSTALLER}."
