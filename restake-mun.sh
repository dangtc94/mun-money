#!/bin/bash

# withdraw rewards
mund tx distribution withdraw-rewards munvaloper1mjlrtfdkqdtluhqr9rn2wsa7jed0tzxux4zfp2  --commission --from dw  --gas auto --gas-adjustment 1.5 -y --broadcast-mode block --chain-id testmun --keyring-backend test

sleep 30



