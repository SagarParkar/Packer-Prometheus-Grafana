#!/bin/bash
sudo nsenter -t 1 -m -u -n -i bash -c "cd /home/sparkar/observability/telemetry/scripts && bash airbytestart.sh"