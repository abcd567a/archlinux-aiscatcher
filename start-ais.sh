#!/bin/sh
CONFIG=""
while read -r line; do CONFIG="${CONFIG} $line"; done < /usr/share/aiscatcher/aiscatcher.conf
/usr/local/bin/AIS-catcher ${CONFIG}
