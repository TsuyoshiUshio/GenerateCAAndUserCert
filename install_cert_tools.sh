#!/bin/bash

# Install stronggswan related library. 
# For more details of apt command refer to https://linuxize.com/post/how-to-use-apt-command/
sudo apt update && sudo apt install -y strongswan strongswan-pki libstrongswan-extra-plugins
