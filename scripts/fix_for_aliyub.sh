#!/bin/bash

###############################################################################
# Creates the required certificates for use in some Aliyun services.          #
###############################################################################

cat cert.pem > fullchain-fixed.pem
cat chain.pem >> fullchain-fixed.pem
openssl rsa -in privkey.pem -out privkey.rsa -traditional
