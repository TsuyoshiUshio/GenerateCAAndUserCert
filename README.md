# Generate and export certificate

This shell files are required for generate and export certificates that is required for VPN for VNET. 
I'm following this documentation. [Generate and export certificates](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-certificates-point-to-site-linux#generate-and-export-certificates-1).

# Generate CA certificate 

```bash
$ ./generate_and_export.cacert.sh
```

You will find the `caCert_base64.txt` file that contains caCert with base64 encoded. That is required for Azure. 

# Generate User certificate

Create user certificate. It will generate `*.p12` file as a bundle of user certificate and ca certificate.

```bash
$ ./generate_user_certificate USERNAME PASSWORD
```

# Install cert tools

If you don't have a strongSwan PKI tool, you can install it by this script. 

```bash
$ ./install_cert_tools.sh
```