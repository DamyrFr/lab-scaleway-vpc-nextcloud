#!/usr/bin/env bash

all_data=`scw vpc-gw dhcp-entry list | grep $1`
arr=($all_data)
echo "{\"id\": \"${arr[0]}\",\"gateway\": \"${arr[1]}\",\"ip\": \"${arr[2]}\",\"mac\": \"${arr[3]}\",\"hostname\": \"${arr[4]}\",\"type\": \"${arr[5]}\"}"
