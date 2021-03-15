# Intended for sourcing by other shell scripts
# This file is automatically generated by fs-package

. ./fsbuild/system.sh
. ./PACKAGE.FS

if [ "$SYSTEM_OS" = "macOS" ]; then
if [ "$PLUGIN_APPIFY" = "0" ]; then
echo "Skip appify"
elif [ "$PLUGIN_SKIP_APPIFY" = "1" ]; then
echo "Skip appify"
elif [ -d "$PLUGIN_BINDIR/$PACKAGE_NAME_PRETTY.app" ]; then
echo "App bundle already exists"
else
if [ "$EXECUTABLE" = "" ]; then
EXECUTABLE=$PACKAGE_NAME
fi
if [ $PACKAGE_TYPE = "fs-library-plugin" ]; then
sh fsbuild/frameworkify.sh $PLUGIN_BINDIR $PACKAGE_NAME_PRETTY \
$EXECUTABLE $PACKAGE_MACOS_BUNDLE_ID
else
sh fsbuild/appify.sh $PLUGIN_BINDIR $PACKAGE_NAME_PRETTY \
$EXECUTABLE $PACKAGE_MACOS_BUNDLE_ID
fi
fi
fi

if [ "$PLUGIN_STANDALONE" = "0" ]; then
echo "Skip standalone"
elif [ "$PLUGIN_SKIP_STANDALONE" = "1" ]; then
echo "Skip standalone"
else
# python3 fsbuild/standalone.py $PLUGIN_BINDIR
LIBGPG_ERROR_CHECK=0 python3 fsbuild/standalone.py $PLUGIN_BINDIR
fi

echo "[plugin]" > $PLUGIN_DIR/Plugin.ini
echo "name = $PACKAGE_NAME_PRETTY" >> $PLUGIN_DIR/Plugin.ini
echo "version = $PACKAGE_VERSION" >> $PLUGIN_DIR/Plugin.ini
unix2dos $PLUGIN_DIR/Plugin.ini

echo "$PACKAGE_VERSION" > $PLUGIN_DIR/Version.txt
unix2dos $PLUGIN_DIR/Version.txt

if [ -d $PLUGIN_BINDIR ]; then
echo "$PACKAGE_VERSION" > $PLUGIN_BINDIR/Version.txt
unix2dos $PLUGIN_BINDIR/Version.txt
fi
