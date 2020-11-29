#!/bin/bash

export USERNAME=$1
export PASSWORD=$2

function usage() {
    echo "USERNAME: ${USERNAME} PASSWROD: ${PASSWORD}" 
    echo "Usage: generate_user_certificate.sh USERNAME PASSWORD"
    exit 1 
}

if [ -z "$USERNAME" ];
then
   usage
fi

if [ -z "$PASSWORD" ];
then
   usage
fi


# Generate the user certificate Subject Altername (--san)
ipsec pki --gen --outform pem > "${USERNAME}Key.pem"
ipsec pki --pub --in "${USERNAME}Key.pem" | ipsec pki --issue --cacert caCert.pem --cakey caKey.pem --dn "CN=${USERNAME}" --san "${USERNAME}" --flag clientAuth --outform pem > "${USERNAME}Cert.pem"

# Generate a p12 bundle containing the user certificate
# PKCS #12 defines an archive file format for storing many cryptograph objects as a single file. 
# It is commonly used to bundle a private key with its X.509 certificate or to bundle all the member of a chain of trust.
openssl pkcs12 -in "${USERNAME}Cert.pem" -inkey "${USERNAME}Key.pem" -certfile caCert.pem -export -out "${USERNAME}.p12" -password "pass:${PASSWORD}"