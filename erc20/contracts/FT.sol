// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";

contract FT is ERC20("FT Token", "FT"), Ownable {
  using SafeMath for uint256;
  // 生成token
  function mint(address to, uint256 amount) external onlyOwner {
    _mint(to, amount);
  }

  // 销毁token
  function burn(address from, uint256 amount) external onlyOwner {
    _burn(from, amount);
  }

  function deposit(address user, bytes calldata depositData) external {
      uint256 amount = abi.decode(depositData, (uint256));

      // `amount` token getting minted here & equal amount got locked in RootChainManager
      // _totalSupply = _totalSupply.add(amount);
      // _balances[user] = _balances[user].add(amount);
      // emit Transfer(address(0), user, amount);
      _mint(user, amount);
  }

  function withdraw(uint256 amount) external {
      // _balances[msg.sender] = _balances[msg.sender].sub(amount, "ERC20: burn amount exceeds balance");
      // _totalSupply = _totalSupply.sub(amount);
      
      // emit Transfer(msg.sender, address(0), amount);
      _burn(_msgSender(), amount);
  }
}