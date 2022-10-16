# #!/bin/bash

# mund tx staking create-validator --from dw --moniker mun-moon-sun --pubkey $(mund tendermint show-validator) --chain-id testmun --keyring-backend test --amount 50000000000utmun --commission-max-change-rate 0.01 --commission-max-rate 0.2 --commission-rate 0.1 --min-self-delegation 1 --fees 200000utmun --gas auto --gas=auto --gas-adjustment=1.5 -y

# # withdraw rewards
# mund tx distribution withdraw-rewards munvaloper1mjlrtfdkqdtluhqr9rn2wsa7jed0tzxux4zfp2  --commission --from dw  --gas auto --gas-adjustment 1.5 -y --broadcast-mode block --chain-id testmun --keyring-backend test
# sleep 30

# #check balance
# mund query bank balances mun1mjlrtfdkqdtluhqr9rn2wsa7jed0tzxu90m3mt --chain-id testmun


# #restake
# mund tx staking delegate munvaloper1mjlrtfdkqdtluhqr9rn2wsa7jed0tzxux4zfp2  40000000000utmun --from dw -y  --gas auto --gas-adjustment 1.5 -y --broadcast-mode block --chain-id testmun --keyring-backend test

val1="munvaloper1tl8lae0899w5u4ay99a6ke87qqx0xkatalkg9j"

add1="mun1tl8lae0899w5u4ay99a6ke87qqx0xkat790sln"

for (( ;; )); do
    echo -e "\033[0;32mCollecting rewards!\033[0m"
    mund tx distribution withdraw-rewards $val1 --commission --from dw --gas auto --gas-adjustment 1.5 -y --broadcast-mode block --chain-id testmun --keyring-backend test
    echo -e "\033[0;32mWaiting 30 seconds before requesting balance\033[0m"
    sleep 30
    AMOUNT=$(mund q bank balances $add1 | grep amount | awk '{split($0,a,"\""); print a[2]}')
    AMOUNT=$(($AMOUNT - 500000))
    AMOUNT_STRING=$AMOUNT"utmun"
    echo -e "Your total balance: \033[0;32m$AMOUNT_STRING\033[0m"
     mund tx staking delegate $val1 $AMOUNT_STRING --from dw -y  --gas auto --gas-adjustment 1.5 -y --broadcast-mode block --chain-id testmun --keyring-backend test
    echo -e "\033[0;32m$AMOUNT_STRING staked! Restarting in 7200 sec!\033[0m"
    sleep 7200
done