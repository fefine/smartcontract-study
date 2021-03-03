pragma solidity 0.6.12;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract FT is ERC20("FT Token", "FT"), Ownable {
  // 生成token
  function mint(address to, uint256 amount) external onlyOwner {
    _mint(to, amount);
  }

  // 销毁token
  function burn(address from, uint256 amount) external onlyOwner {
    _burn(from, amount);
  } 
}