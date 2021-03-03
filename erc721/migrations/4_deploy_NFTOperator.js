const NFTCore = artifacts.require("NFT");
const NFTOperator = artifacts.require("NFTOperator");

module.exports = function (deployer) {
  deployer.deploy(NFTOperator, NFTCore.address);
};
