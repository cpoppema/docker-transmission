#!/bin/bash

apt-get update -qq
apt-get --only-upgrade install -y transmission-cli transmission-daemon
