// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

interface INFTOperator {
  function isApprovedOperator(address _operator) external view returns (bool);
  function addOperator(address _operator) external;
  function removeOperator(address _operator) external;
  function mint(address _onwer) external returns (uint256);
}