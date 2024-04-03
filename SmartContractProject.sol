// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract SmartContractProject {
    // Function that uses require statement
    function withdraw(uint256 _amount) public payable {
        require(_amount <= address(this).balance, "Insufficient balance");
        payable(msg.sender).transfer(_amount);
    }

    // Function that uses assert statement
    function assertExample(uint256 _value, uint256 _minValue) public pure returns (uint256) {
        uint256 result = _value + _minValue;
        assert(result >= _value);
        return result;
    }

    // Function that uses revert statement
    function revertExample(uint256 _input) public pure returns (uint256) {
        require(_input != 0, "Input should not be zero");
        return _input * 2;
    }
}
