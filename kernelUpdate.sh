#!/bin/bash
##########################################
# WSL Kernel Updater Script by OnyxAzryn #
#    Kernel provided by nathanchance     #
#	Last Updated: 08/19/2020	 #
##########################################
# Kernel Source: https://github.com/nathanchance/WSL2-Linux-Kernel

# Get newest version identifier
# PACKAGE_DIR is a folder that stores the version information and the kerenl image
PACKAGE_DIR=<Provide your path here>
NEWEST_VERSION=$(curl --silent "https://github.com/nathanchance/WSL2-Linux-Kernel/releases/latest" | sed "s#.*tag/\(.*\)\".*#\1#")
CURRENT_VERSION=$(cat $PACKAGE_DIR/version)
# Check if new version should be downloaded
if [[ "{$CURRENT_VERSION}" == "" ]] || [[ "$CURRENT_VERSION" != "$NEWEST_VERSION" ]];
then
	printf "Downloading new update ($NEWEST_VERSION)!\n"
	# Download new bzImage and move it to kernel location
	curl -L -o ~/bzImage "https://github.com/nathanchance/WSL2-Linux-Kernel/releases/download/$NEWEST_VERSION/bzImage"
	mv ~/bzImage $PACKAGE_DIR/bzImage
	# Update env
	rm $PACKAGE_DIR/version
	echo "$NEWEST_VERSION" >> $PACKAGE_DIR/version
else
	printf "Kernel is already at latest version ($CURRENT_VERSION)!\n"
fi
