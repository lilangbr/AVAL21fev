#!/bin/bash

nginxCONFIGfile='/etc/nginx/sites-available/nginx.conf'

grep "autoindex on;" "$nginxCONFIGfile" > /dev/null
if [ $? -eq 0 ]; then
    echo "Autoindex is ON."
    echo "Would you like to change this?(y=1/n=2)"
    read RESPONSE
    if [ $RESPONSE -eq 1 ]; then
        echo "Changing the status and reloading the server......"
        sed -i "s/autoindex on/autoindex off/" "$nginxCONFIGfile"
        service nginx restart;
    elif [ $RESPONSE -eq 2 ]; then
        echo "Autoindex remains ON.";
    else
        echo "Are you kidding me?"
        echo "(If you want to change the state of the autoindex, call the script again.)";
    fi
else
    echo "Autoindex is OFF."
    echo "Would you like to change this?(y=1/n=2)"
    read RESPONSE
    if [ $RESPONSE -eq 1 ]; then
        echo "Changing the status and reloading the server......"
        sed -i "s/autoindex off/autoindex on/" "$nginxCONFIGfile"
        service nginx restart;
    elif [ $RESPONSE -eq 2 ]; then
        echo "Autoindex remains OFF.";
    else
        echo "Are you kidding me?"
        echo "(If you want to change the state of the autoindex, call the script again.)";
    fi
fi


