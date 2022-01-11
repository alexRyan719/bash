#!/bin/bash
# Script for Operation Happy Days to revert to the original MAC address and IP address

macchanger -p eth1;
ifconfig eth1 192.168.56.104;
