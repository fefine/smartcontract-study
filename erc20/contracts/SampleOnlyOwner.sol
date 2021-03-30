// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

import "@openzeppelin/contracts/access/Ownable.sol";

contract SampleOnlyOwner is Ownable {
  function normalOp() public view {}

  function ownerOp() public onlyOwner view {}
}

