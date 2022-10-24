#!/bin/sh

./themes/projektemacher-base/scripts/cleanup.sh
rm -rf static/images/*.svg
find content -name front.jpg -exec rm {} \;
