const NFTCore = artifacts.require("NFT");

const operator = "0xe1c6ba8bD0f4D770965f854C5cC1d8Eba5Eb572a";

module.exports = function (deployer) {
  deployer.deploy(NFTCore, operator);
};
