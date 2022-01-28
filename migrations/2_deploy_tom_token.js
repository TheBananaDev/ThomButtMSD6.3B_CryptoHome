var tomToken = artifacts.require("./TomToken.sol");

module.exports = function(deployer) {
  deployer.deploy(tomToken);
};