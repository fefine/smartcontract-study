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
      provider: () => new HDWalletProvider("moral wall festival system beyond tool abstract neglect slam account negative clock", "https://rinkeby.infura.io/v3/xxx"),
      network_id: 4,
      gas: 3000000,
      gasPrice: 10000000000
    }
  },
  plugins: [
    'truffle-plugin-verify'
  ],
  api_keys: {
    etherscan: 'xxx'
  }
};