#!/bin/bash
set -e
set -x

# Update ubuntu
/narra-build/scripts/ubuntu.sh

# NARRA initialization
/narra-build/scripts/narra-init.sh

# Build morphodita
/narra-build/scripts/morphodita.sh

# Build ffmpeg
/narra-build/scripts/ffmpeg.sh

# Install imagemagick
/narra-build/scripts/imagemagick.sh

# Prepare NARRA to update repo while boot
mkdir -p /etc/my_init.d
cp /narra-build/scripts/narra_init.sh /etc/my_init.d/01_narra.sh

# Enable the NARRA worker service.
mkdir /etc/service/narra-worker
cp /narra-build/scripts/narra_worker.sh /etc/service/narra-worker/run
