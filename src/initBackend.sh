#!/bin/bash

echo "Initialize Flask Server";

# Check if folder still exists
if [ -d pigsterBackend ]
then
	echo "Pull main";
	cd ~/pigsterBackend;
	git pull;
else
	echo "Clone main";
	git clone https://github.com/don-kanaille/pigsterBackend.git;
	cd ~/pigsterBackend;
fi

sleep 5;

# Check if venv folder still exists
if [ -d venv ]
then
	echo "Activate venv";
	source venv/bin/activate;
else
	echo "Create venv";
	virtualenv venv;
	source venv/bin/activate;
fi

# If youre in venv install packages
if [[ "$VIRTUAL_ENV" != "" ]]
then
	echo "Installing packages to $VIRTUAL_ENV";
	pip install -r "requirements.txt";

	echo "Start Flask Backend ...";
	python3 app.py &
else
	echo "Unable to activate venve + install packages!";
fi
echo "Done!";
