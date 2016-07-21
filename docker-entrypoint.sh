#!/bin/bash
set -e

ln -sf /root/neural-style/neural_style.lua /out/
ln -sf /root/neural-style/models/ /out/
chmod 777 -R /out/
cd /out/

exec "$@"
