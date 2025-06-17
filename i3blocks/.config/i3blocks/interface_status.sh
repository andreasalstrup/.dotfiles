#!/bin/bash

OUTGOING_INTERFACE=$(ip route get 1.1.1.1 | awk '{print $5}')
PRIVATE_IP=$(hostname -I | awk '{print $1}')
echo $OUTGOING_INTERFACE $PRIVATE_IP
