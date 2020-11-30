#!/bin/bash

# Install stronggswan related library. 
# For more details of apt command refer to https://linuxize.com/post/how-to-use-apt-command/
sudo apt update && sudo apt install -y strongswan strongswan-pki libstrongswan-extra-plugins
libcharon-extra-plugins

# This is required for WSL2 Ubuntu 20.04 https://github.com/MicrosoftDocs/azure-docs/issues/32421#issuecomment-515763538
sudo apt install -y libcharon-extra-plugins