let GradientTokens = artifacts.require("../contracts/GradientToken.sol");

module.exports = function (deployer) {
  deployer.deploy(GradientTokens);
};
