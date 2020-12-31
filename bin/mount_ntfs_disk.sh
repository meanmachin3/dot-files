#!/bin/bash

# This script mount one or more ntfs disks on a mac (with read and write access).
# 
# It is inspirated from the wiki available on https://github.com/osxfuse/osxfuse/wiki/NTFS-3G
# but prevents to replace the Apple's NTFS mount tool (located on /sbin/mount_ntfs) by using a
# simple command.
#
# To use this script, some preconditions are required: 
#   - macFuse must be installed (https://osxfuse.github.io/)
#   - homebrew must be installed (https://brew.sh)
#   - NTFS-3G must be installed (brew install ntfs-3g)
#   - This script must have execution rights (chmod +x mount_ntfs.sh)


# We check if we have one or more disk mounted
if [ -z "$(diskutil list | grep Windows_NTFS)" ]
then 
    echo "No NTFS disk available"
    exit 0
fi

# Get the identifiers from the NTFS disks
VOLUME_IDENTIFIERS=$(diskutil list | grep Windows_NTFS | awk '{print $NF}' )

# Convert the VOLUME_IDENTIFIERS to an array
ARRAY_VOLUME_IDENTIFIERS=(`echo $VOLUME_IDENTIFIERS | tr '\n' ' '`)

# Mount each NTFS disks
for VOLUME_IDENTIFIER in ${ARRAY_VOLUME_IDENTIFIERS[@]}
do
    # Unmount the disk
    sudo diskutil unmount ${VOLUME_IDENTIFIER}

    # Create a ntfs volume if this one isn't created yet
    if [ ! -e "/Volumes/${VOLUME_IDENTIFIER}_ntfs" ]
    then
        sudo mkdir /Volumes/${VOLUME_IDENTIFIER}_ntfs
    fi

    # Mount the Disk
    sudo /usr/local/bin/ntfs-3g /dev/${VOLUME_IDENTIFIER} /Volumes/${VOLUME_IDENTIFIER}_ntfs -o local -o allow_other -o auto_xattr -o auto_cache
done 
