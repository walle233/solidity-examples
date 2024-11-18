// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract DataLocations {
    uint256[] public numbers; // 'numbers' is a state variable and is stored in 'storage'

    // 'arr' is a function argument and is stored in 'calldata'
    function addToNumbers(uint256[] calldata arr) public {
        for (uint256 i = 0; i < arr.length; i++) {
            numbers.push(arr[i]); // 'arr[i]' is read from 'calldata'
        }
    }

    // 'x' is a local variable and is stored in 'memory'
    function calculateSum(uint256[] calldata arr) public pure returns (uint256) {
        uint256 sum = 0; // 'sum' is a local variable and is stored in 'memory'
        for (uint256 i = 0; i < arr.length; i++) {
            sum += arr[i]; // 'arr[i]' is read from 'calldata'
        }
        return sum;
    }
}
