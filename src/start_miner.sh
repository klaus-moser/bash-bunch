#!/bin/bash

cd ~/duino-coin;

echo $(date -u) "Start Miner" >> start_miner.log;

python3 PC_Miner.py;
