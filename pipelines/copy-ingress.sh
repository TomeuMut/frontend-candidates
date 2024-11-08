HOST=$1
SRC=$2
DEST=$3

scp -v -i /src/key \
    -o StrictHostKeyChecking=no \
    $SRC \
    root@$HOST:$DEST

ssh -v -i /src/key \
    root@$HOST \
    chmod 664 $DEST
