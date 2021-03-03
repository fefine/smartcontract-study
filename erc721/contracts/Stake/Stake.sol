// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155Receiver.sol";

import "../interfaces/INFTOperator.sol";
import "../interfaces/IStake.sol";

contract Stake is IStake, Ownable, Pausable, ERC1155Receiver {

  event MintNFT(address indexed owner, uint256 id, uint256 amount);
  event BurnNFT(address indexed owner, uint256 id, uint256 amount);


  IERC20 public stakeToken;
  INFTOperator public operator;
  uint256 public nftPrice;

  mapping(uint256 => NFTInfo) public nftInfos;

  struct NFTInfo {
    uint256 amount;
    uint256 depositBlock;
  }

  constructor(
    IERC20 _token,
    INFTOperator _operator,
    uint256 _nftPrice
  ) {
    stakeToken = _token;
    operator = _operator;
    nftPrice = _nftPrice;
  }

  // --------
  function Deposit() external override returns (uint256) {
    // 扣款
    require(stakeToken.transferFrom(_msgSender(), address(this), nftPrice), "Insufficient balance");
    // mint
    uint256 _id = operator.mint(_msgSender());
    NFTInfo memory info = NFTInfo({
      amount: nftPrice,
      depositBlock: block.number
    });
    nftInfos[_id] = info;
    emit MintNFT(_msgSender(), _id, nftPrice);
    return _id;
  }

  // --------- manage

  function setNFTPrice(uint256 _price) external onlyOwner {
    nftPrice = _price;
  }

  function pause() external onlyOwner {
    _pause();
  }

  function unpause() external onlyOwner {
    _unpause();
  }

  // --------- erc1155 receiver
  function onERC1155Received(
        address,
        address _from,
        uint256 _id,
        uint256,
        bytes calldata
    ) external
      override
      returns(bytes4) {
    require(stakeToken.transferFrom(address(this), _from, nftPrice), "Contract Insufficient balance");
    delete nftInfos[_id];
    emit BurnNFT(_from, _id, nftPrice);
      return
          bytes4(
              keccak256(
                  "onERC1155Received(address,address,uint256,uint256,bytes)"
              )
          );
  }
  
  function onERC1155BatchReceived(
        address,
        address,
        uint256[] calldata,
        uint256[] calldata,
        bytes calldata
    ) external pure override returns(bytes4) {
      return bytes4(
          keccak256(
              "onERC1155BatchReceived(address,address,uint256[],uint256[],bytes)"
          )
      );
  }

}
