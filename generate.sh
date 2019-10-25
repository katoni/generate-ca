#!/usr/bin/env bash

echo "+--------------------------------+"
echo "| Generate Certificate Authority |"
echo "+--------------------------------+"
echo

export CA_KEY=${CA_KEY-"ca-key.pem"}
export CA_CERT=${CA_CERT-"ca.pem"}
export CA_SUBJECT=${CA_SUBJECT:-"Fake Authority X1"}
export CA_EXPIRE=${CA_EXPIRE:-"1800"}
export CA_SIZE=${CA_SIZE:-"2048"}

echo "
[ v3_ca ]
basicConstraints = critical,CA:TRUE
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid:always,issuer:always
" >> /etc/ssl/openssl.cnf

openssl genrsa -out ${CA_KEY} ${CA_SIZE} > /dev/null

openssl req -x509 -new -nodes -key ${CA_KEY} -days ${CA_EXPIRE} -out ${CA_CERT} -extensions v3_ca -subj "/CN=${CA_SUBJECT}" > /dev/null  || exit 1

echo
echo "Certificate is stored in: $(pwd)"
echo
