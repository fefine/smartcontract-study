pragma solidity 0.6.12;

import "@openzeppelin/contracts/access/Ownable.sol";
// import "@openzeppelin/contract/token/ERC20.sol"

contract SampleOnlyOwner is Ownable {
  function normalOp() public {}

  function ownerOp() public onlyOwner {}
}

