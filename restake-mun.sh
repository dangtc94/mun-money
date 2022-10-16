# #!/bin/bash

# # withdraw rewards
# mund tx distribution withdraw-rewards munvaloper1mjlrtfdkqdtluhqr9rn2wsa7jed0tzxux4zfp2  --commission --from dw  --gas auto --gas-adjustment 1.5 -y --broadcast-mode block --chain-id testmun --keyring-backend test
# sleep 30

# #check balance
# mund query bank balances mun1mjlrtfdkqdtluhqr9rn2wsa7jed0tzxu90m3mt --chain-id testmun


# #restake
# mund tx staking delegate munvaloper1mjlrtfdkqdtluhqr9rn2wsa7jed0tzxux4zfp2  40000000000utmun --from dw -y  --gas auto --gas-adjustment 1.5 -y --broadcast-mode block --chain-id testmun --keyring-backend test


for (( ;; )); do
    echo -e "\033[0;32mCollecting rewards!\033[0m"
    mund tx distribution withdraw-rewards munvaloper1mjlrtfdkqdtluhqr9rn2wsa7jed0tzxux4zfp2 --commission --from dw --gas auto --gas-adjustment 1.5 -y --broadcast-mode block --chain-id testmun --keyring-backend test
    echo -e "\033[0;32mWaiting 30 seconds before requesting balance\033[0m"
    sleep 30
    AMOUNT=$(mund q bank balances mun1mjlrtfdkqdtluhqr9rn2wsa7jed0tzxu90m3mt | grep amount | awk '{split($0,a,"\""); print a[2]}')
    AMOUNT=$(($AMOUNT - 500))
    AMOUNT_STRING=$AMOUNT"utmun"
    echo -e "Your total balance: \033[0;32m$AMOUNT_STRING\033[0m"
     mund tx staking delegate munvaloper1mjlrtfdkqdtluhqr9rn2wsa7jed0tzxux4zfp2 $AMOUNT_STRING --from dw -y  --gas auto --gas-adjustment 1.5 -y --broadcast-mode block --chain-id testmun --keyring-backend test
    echo -e "\033[0;32m$AMOUNT_STRING staked! Restarting in 7200 sec!\033[0m"
    sleep 7200
done