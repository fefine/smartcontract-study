const FT = artifacts.require("FT");
const NFTOperator = artifacts.require("NFTOperator");
const Stake = artifacts.require("Stake");

const nftPrice = "8000000000000000000"; // 8 FT

module.exports = function (deployer) {
  deployer.deploy(Stake, FT.address, NFTOperator.address, nftPrice);
};
