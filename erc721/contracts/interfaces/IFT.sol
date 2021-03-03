// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

interface IFT {
  function mint(address _to, uint256 _amount) external;
  function burn(address _from, uint256 _amount) external;
}