require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
// const ALCHEMY_API_KEY = "KEY";

// Replace this private key with your Ropsten account private key
// To export your private key from Metamask, open Metamask and
// Be aware of NEVER putting real Ether into testing accounts
const MAINNET_PRIVATE_KEY = process.env.BSC_MAINNET_PK;
const TESTNET_PRIVATE_KEY = process.env.BSC_TESTNET_PK;
const BSC_API_KEY = process.env.BSCSCAN_API_KEY;

// task("accounts", "Prints the list of accounts", async () => {
//   const accounts = await ethers.getSigners();
//
//   for (const account of accounts) {
//     console.log(account.address);
//   }
// });

module.exports = {
  defaultNetwork: "testnet",
  networks: {
    testnet: {
      chainId: 97,
      url: "https://data-seed-prebsc-1-s1.binance.org:8545",
      accounts: [
        `${TESTNET_PRIVATE_KEY}`,
      ]
    },
    mainnet: {
      chainId: 56,
      url: "https://bsc-dataseed1.binance.org",
      accounts: [`${TESTNET_PRIVATE_KEY}`]
    },
    rinkeby: {
      chainId: 4,
      url: "https://rinkeby.infura.io/v3/762b6ebf3ca247fbaf63b7bf33571a5c",
      accounts: [`${TESTNET_PRIVATE_KEY}`]
    },
  },
  solidity: {
    version: "0.7.6",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  paths: {
    cache: "./build/cache",
    artifacts: "./build/artifacts"
  },
  etherscan: {
    apiKey: `${BSC_API_KEY}`
  }
};