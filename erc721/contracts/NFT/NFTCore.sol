// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "../interfaces/INFT.sol";
import "./NFTBase.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";


contract NFT is INFT, NFTBase, ERC1155("") {

  constructor(
    address _operator
  ) {
    operator = _operator;
  }

  function mint(address _owner) external override onlyOperator returns (uint256) {
    uint32 id = uint32(nfts.length);
    NFT memory nft = NFT({
      name: "",
      id: id,
      birthday: uint64(block.timestamp),
      mintBy: _owner
    });
    nfts.push(nft);
    _mint(_owner, id, 1, "");
    return id;
  }

  function updateNFTName(uint256 _id, string memory _name) external {
    require(_msgSender() == owner() || balanceOf(_msgSender(), _id) == 1, "Permission deined");
    NFT storage nft = nfts[_id];
    nft.name = _name;
  }

  function setURI(string memory newurl) external onlyOwner {
    _setURI(newurl);
  }

}