/bin/sh

SOURCE="themes/projektemacher-base/static/images/cm.svg" OPTIONS="-transparent white static/images/favicon-128.png" ./themes/projektemacher-base/scripts/favicon.sh

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
