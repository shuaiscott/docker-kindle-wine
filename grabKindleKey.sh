#!/bin/bash
export WINEDEBUG=-all
echo "##### Installing Python 3.8.9..."
wine python-3.8.9.exe /quiet
echo "##### Grabbing Kindle Key..."
wine py kindlekey.py kindlekeys/kindlekey.k4i
