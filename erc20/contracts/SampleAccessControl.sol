pragma solidity 0.6.12;

import "@openzeppelin/contracts/access/AccessControl.sol";


contract SampleAccessControl is AccessControl {
  mapping (address=>bytes32) private _data;

  function read() public returns (bytes32) {
    require(_data[_msgSender()] != 0x0);
    return _data[_msgSender()];
  }

  function write(bytes32 value) public returns (bool) {
    _data[_msgSender()] = value;
    return true;
  }

}
