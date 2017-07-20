#!/bin/bash

### Generate a random password
SSH_PASSWORD=`pwgen -c -n -1 12`
echo ssh user: jenkins
echo ssh password: $SSH_PASSWORD

### Set a password for jenkins user
usermod -p $(openssl passwd -1 $SSH_PASSWORD) jenkins
