#!/bin/bash


echo "Clone/Update Miner";


# Check if folder still exists

if [ -d duino-coin ]
then
	cd ~/duino-coin;
	git pull;
else
	git clone https://github.com/revoxhere/duino-coin.git;
	cd ~/duino-coin;
fi


sleep 3;


# Check venv folder

if [ -d venv ]
then
	source venv/bin/activate;
else
	virtualenv venv;
	source venv/bin/activate;
fi


# If youre in venv install/update packages

if [[ "$VIRTUAL_ENV" != "" ]]
then
	pip install -r "requirements.txt";

	echo "Start Miner";
	python3 PC_Miner.py
else
	echo "Unable to activate venv + install packages!" >> error.log;
fi
