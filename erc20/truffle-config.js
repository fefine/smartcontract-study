const HDWalletProvider = require("@truffle/hdwallet-provider");

// require('dotenv').config()  // Store environment-specific variable from '.env' to process.env

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    },
    rinkeby: {
      provider: () => new HDWalletProvider("moral wall festival system beyond tool abstract neglect slam account negative clock", "https://rinkeby.infura.io/v3/762b6ebf3ca247fbaf63b7bf33571a5c"),
      network_id: 4,
      gas: 3000000,
      gasPrice: 10000000000
    },
    goerli: {
      provider: () => new HDWalletProvider("moral wall festival system beyond tool abstract neglect slam account negative clock", "https://goerli.infura.io/v3/762b6ebf3ca247fbaf63b7bf33571a5c"),
      network_id: 5,
      gas: 3000000,
      gasPrice: 10000000000
    },
    mumbai: {
      provider: () => new HDWalletProvider("moral wall festival system beyond tool abstract neglect slam account negative clock", "https://rpc-mumbai.matic.today"),
      network_id: 80001,
      gas: 3000000,
      gasPrice: 10000000000,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true
    },
    matic: {
      provider: () => new HDWalletProvider("moral wall festival system beyond tool abstract neglect slam account negative clock", "https://rpc-mainnet.matic.network"),
      network_id: 137,
      gas: 3000000,
      gasPrice: 10000000000
    },
  },
  compilers: {
    solc: {
      version: '0.6.12'
    }
  },
  plugins: [
    'truffle-plugin-verify'
  ],
  api_keys: {
    etherscan: '4CJWISFI1IWPBIIHB5ZCZRTI4S3CAHU5U2'
  }
};