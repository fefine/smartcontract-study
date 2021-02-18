const SampleOnlyOwner = artifacts.require("SampleOnlyOwner");

module.exports = function (deployer) {
  deployer.deploy(SampleOnlyOwner);
};
