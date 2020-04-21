#!/bin/bash -e

PLUGIN_NAME="$(basename $(dirname $(readlink -f $0)))"
PLUGIN_VERSION=$(grep d_version plugins/StereoGain/PluginStereoGain.hpp | sed -E 's/.*([0-9]+), ([0-9]+), ([0-9]+).*/\1.\2.\3/g')
TARBALL_NAME="$PLUGIN_NAME-v$PLUGIN_VERSION-source.tar.gz"
REPO_URL="https://github.com/osamc-lv2-workshop/$PLUGIN_NAME.git"

(
   rm -rf "dist/$PLUGIN_NAME";
   mkdir -p dist;
   cd dist;
   git clone --recursive "$REPO_URL" --branch "v$PLUGIN_VERSION" --single-branch "$PLUGIN_NAME";
   cd "$PLUGIN_NAME";
   find . -name ".git" -type f -delete;
   rm -rf .git;
   find . -name ".gitignore" -type f -delete;
   find . -name ".gitmodules" -type f -delete;
   cd ..;
   tar -zcvf "$TARBALL_NAME" "$PLUGIN_NAME/";
   rm -rf "$PLUGIN_NAME/";
)

gpg --armor --detach-sign "dist/$TARBALL_NAME"
