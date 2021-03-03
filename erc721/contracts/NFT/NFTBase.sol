// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "@openzeppelin/contracts/access/Ownable.sol";

// 定义一些常量
contract NFTBase is Ownable {

  // mint nft
  address public operator;
  // nfts, 只有contract内部使用, 不暴露出去
  NFT[] internal nfts;
  // 

  struct NFT {
    string name; // name
    uint32 id;   // id
    uint64 birthday;
    address mintBy;
  }

  // --------- view --------- //
  function getNFT(uint256 _id) public view returns (
    uint256 id,
    string memory name,
    uint64 birthday,
    address mintBy
  ) {
    NFT storage nft = nfts[_id];
    id = nft.id;
    name = nft.name;
    birthday = nft.birthday;
    mintBy = nft.mintBy;
  }

  function getTotalNFT() external view returns (uint256) {
    return nfts.length;
  }

  // --------- edit ------- //
  function transferOperator(address _newOperator) external onlyOwner {
    operator = _newOperator;
  }

  // --------- MODIFER -------- //
  modifier onlyOperator() {
    require(_msgSender() == operator, "Permission Deine");
    _;
  }

}