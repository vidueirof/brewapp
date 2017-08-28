#!/bin/sh

if [[ -z "$ENCRYPTION_SECRET" ]]; then  
    echo "Error: Missing encryption secret."
    exit 1
fi

if [[ -z "$PROFILE_NAME" ]]; then  
    echo "Error: Missing provision profile name"
    exit 1
fi

if [[ ! -e "./scripts/profile/$PROFILE_NAME.mobileprovision.enc" ]]; then  
    echo "Error: Missing encrypted provision profile"
    exit 1
fi

if [[ ! -e "./scripts/certs/dist.cer.enc" ]]; then  
    echo "Error: Missing encrypted distribution cert."
    exit 1
fi

if [[ ! -e "./scripts/certs/dist.p12.enc" ]]; then  
    echo "Error: Missing encrypted private key."
    exit 1
fi

openssl aes-256-cbc -K $encrypted_72dbb6182f1c_key -iv $encrypted_72dbb6182f1c_iv -in "./scripts/profile/$PROFILE_NAME.mobileprovision.enc" -out "./scripts/profile/$PROFILE_NAME.mobileprovision" -d

#openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in "./scripts/profile/$PROFILE_NAME.mobileprovision.enc" -d -a -out "./scripts/profile/$PROFILE_NAME.mobileprovision"

openssl aes-256-cbc -K $encrypted_5e7b915038c7_key -iv $encrypted_5e7b915038c7_iv -in "./scripts/certs/dist.cer.enc" -out "./scripts/certs/dist.cer" -d

#openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in "./scripts/certs/dist.cer.enc" -d -a -out "./scripts/certs/dist.cer"

openssl aes-256-cbc -K $encrypted_5e7b915038c7_key -iv $encrypted_5e7b915038c7_iv -in "./scripts/certs/dist.p12.enc" -out "./scripts/certs/dist.p12" -d

#openssl aes-256-cbc -k "$ENCRYPTION_SECRET" -in "./scripts/certs/dist.p12.enc" -d -a -out "./scripts/certs/dist.p12"
