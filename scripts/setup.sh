#!/bin/sh

SOURCE="themes/projektemacher-base/static/images/cm.svg" OPTIONS="-transparent white static/images/favicon-128.png" ./themes/projektemacher-base/scripts/favicon.sh

echo "Set SKIP_IIIF to something to disable generation of IIIF derivates"
if [ -z "$SKIP_IIIF" ] ; then
    ./scripts/iiif.sh
fi

echo "Calling theme scripts"
for SCRIPT in $PWD/themes/projektemacher-base/scripts/init/*.sh ; do
    echo "Running $SCRIPT"
    bash "$SCRIPT"
    ERR=$?
    if [ $ERR -ne 0 ] ; then
        echo "Execution of '$SCRIPT' failed!"
        exit $ERR
    fi
done

# Generate Previews
./themes/projektemacher-base/scripts/preview.sh

#./themes/projektemacher-base/scripts/jxl-jpg-stubs.sh
