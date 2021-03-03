// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "../interfaces/IFT.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FT is ERC20("FT Token", "FT"), Ownable, IFT {
  function mint(address _to, uint256 _amount) external override {
    _mint(_to, _amount);
  }

  function burn(address _from, uint256 _amount) external override {
    _burn(_from, _amount);
  }
}
