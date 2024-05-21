## TokenDistributor

a contract distributes a token according to how much of a chain's native currency it is sent.

---

### To Deploy
1. Install [Foundry](https://book.getfoundry.sh/) - you can get it by following the [instructions here](https://book.getfoundry.sh/getting-started/installation) under the "Use Foundryup" section. Namely:
    - Run `curl -L https://foundry.paradigm.xyz | bash`
    - Run `foundryup`
2. Run `forge create TokenDistributor --constructor-args <TOKEN_TO_DISTRIBUTE> <WEI_PER_TOKEN> --rpc-url <RPC_URL> --private-key <YOUR_PRIVATE_KEY>` where:
    - <TOKEN_TO_DISTRIBUTE> = The contract address of the token this contract will distribute
    - <ETH_WEI_PER_TOKEN_WEI> = The price in ETH (or whatever the native token of the chain this is on) wei for 1 wei of the token to distribute
    - <RPC_URL> = An RPC url by which to access the chain you want to deploy to (you can find a bunch of public ones [here](https://github.com/jk-labs-inc/jokerace/tree/staging/packages/react-app-revamp/config/wagmi/custom-chains) if you need)
    - <YOUR_PRIVATE_KEY> = The private key of the wallet (THIS SHOULD BE A HOT WALLET, DO NOT DEPLOY THINGS FROM WALLETS THAT HAVE A LOT OF MONEY IN THEM) you would like to deploy from - there are other ways connect a wallet with forge's `create` command if you'd like to check them out [here](https://book.getfoundry.sh/reference/forge/forge-create) too

Once you deploy, when you send the chain's native currency to this contract, it will return am amount of the token to distribute proportionate to the amount of native currency it is sent and the wei per token price.
