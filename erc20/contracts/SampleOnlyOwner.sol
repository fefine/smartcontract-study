pragma solidity 0.6.12;

import "@openzeppelin/contracts/access/Ownable.sol";

contract SampleOnlyOwner is Ownable {
  function normalOp() public {}

  function ownerOp() public onlyOwner {}
}

