// SPDX-License-Identifier: MIT

pragma solidity = 0.7.6;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/Initializable.sol";

/**
 * @dev
 */
contract Token is ERC20Upgradeable {

    string public var1;
    string public var2;

    /**
      * @dev
      */
    function init(string memory _name, string memory _symbol) external initializer {
        ERC20Upgradeable.__ERC20_init(_name, _symbol);
    }

    function mint(address _receiver, uint256 _amount) external {
        _mint(_receiver, _amount);
    }

    function setVar1(string memory _v1) external {
        var1 = _v1;
    }

    function setVar2(string memory _v2) external {
        var2 = _v2;
    }

}
