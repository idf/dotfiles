#!/usr/bin/env bash
sudo -v;
if !(hash pip 2>/dev/null); then
    echo "installing pip";
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py;
    sudo python get-pip.py;
    rm get-pip.py;
fi
