#!/bin/bash

# Reference: https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-certificates-point-to-site-linux#generate-and-export-certificates-1
# Generate a new private key (--gen) Encoding of generated cert, default :der (--outform)
ipsec pki --gen --outform pem > caKey.pem

# Create a self signed certificate (--self) Extract the subject DN of an X.509 certificate (--dn) Incljude CA basicConstraint, default no (--ca) Private key input file (--in)
# Distinguished Name CN= means Common Name https://www.ibm.com/support/knowledgecenter/en/SSFKSJ_7.5.0/com.ibm.mq.sec.doc/q009860_.htm
ipsec pki --self --in caKey.pem --dn "CN=VPN CA" --ca --outform pem > caCert.pem

# Print the CA certificate in base64 format. This is the format supported by Azure
# -w0 means disable line wrapping (default 76)
openssl x509 -in caCert.pem -outform der | base64 -w0 > caCert_base64.txt



