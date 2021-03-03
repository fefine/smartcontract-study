// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

interface INFT {
  function mint(address _owner) external returns (uint256 _id);
}