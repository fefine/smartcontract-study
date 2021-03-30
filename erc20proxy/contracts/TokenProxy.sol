// SPDX-License-Identifier: MIT

pragma solidity = 0.7.6;

import "@openzeppelin/contracts/proxy/TransparentUpgradeableProxy.sol";

/**
 * @dev
 */
contract TokenProxy is TransparentUpgradeableProxy {

    constructor(address _implement, address _owner, bytes memory _data) TransparentUpgradeableProxy(_implement, _owner, _data) {}

    function proxyImplementation() external view returns (address) {
        return _implementation();
    }

    function proxyAdmin() external view returns (address) {
        return _admin();
    }

}
