# Wave Portal Solidity Smart Contract

- use https://www.alchemy.com/ to push smart contract to blockchain.
- Alchemy essentially helps us broadcast our contract creation transaction so that it can be picked up by miners as quickly as possible. Once the transaction is mined, it is then broadcasted to the blockchain as a legit transaction. From there, everyone updates their copy of the blockchain.

### change `hardhat.config.js`

```
require("@nomiclabs/hardhat-waffle");

module.exports = {
  solidity: "0.8.0",
  networks: {
    rinkeby: {
      url: "YOUR_ALCHEMY_API_URL", // check alchemy.com
      accounts: ["YOUR_PRIVATE_RINKEBY_ACCOUNT_KEY"],
    },
  },
};
```

### Get your private key

MetaMask > Network "Rinkeby Test Network" > 3 dot > Account Details > Export Privatge Key

### Getting some fake $

- https://app.mycrypto.com/faucet
- https://faucets.chain.link/rinkeby

## Run contract on HRE

`npx hardhat run scripts/run.js`

## Start local Ethereum Network

`npx hardhat node`

## Deploy somart contract on local Ethereum Network

`npx hardhat run scripts/deploy.js --network localhost`

## Deploy contract on Rinkeby Test net

`npx hardhat run scripts/deploy.js --network rinkeby`

# Basic Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, a sample script that deploys that contract, and an example of a task implementation, which simply lists the available accounts.

Try running some of the following tasks:

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
node scripts/sample-script.js
npx hardhat help
```
