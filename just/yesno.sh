#!/bin/bash

read -p "Do you want to proceed? (yes/NO) " yn

case $yn in 
	yes ) exit 0;;
	* ) echo Will not do it;
		exit 1;;
esac