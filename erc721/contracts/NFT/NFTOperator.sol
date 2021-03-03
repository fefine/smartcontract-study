// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "@openzeppelin/contracts/utils/EnumerableSet.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

import "../interfaces/INFTOperator.sol";
import "../interfaces/INFT.sol";

contract NFTOperator is INFTOperator, Ownable {
  using EnumerableSet for EnumerableSet.AddressSet;

  EnumerableSet.AddressSet private approvedOperators;

  INFT public nft;

  constructor(
    INFT _nft
  ) {
    nft = _nft;
  }

  //
  // function isApprovedOperator(address _operator) external view returns (bool);
  // function addOperator(address _operator) external;
  // function removeOperator(address _operator) external;
  // function mint(address _onwer) external returns (uint256);

  function isApprovedOperator(address _operator) external view override returns (bool) {
    return approvedOperators.contains(_operator);
  }

  function addOperator(address _operator) external override onlyOwner {
    approvedOperators.add(_operator);
  }

  function removeOperator(address _operator) external override onlyOwner {
    approvedOperators.remove(_operator);
  }

  function mint(address _owner) external override onlyApprovedOperator returns (uint256) {
    return nft.mint(_owner);
  }

  modifier onlyApprovedOperator() {
    require(approvedOperators.contains(_msgSender()));
    _;
  }

}
