#!/bin/bash

if [ ! -f /.dockerenv ]; then
        echo "Not running in docker!"
        exit 1
fi


tail -f /dev/null