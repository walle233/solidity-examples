// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract IfElse {
    // This function demonstrates the use of if/else conditional statements in Solidity.
    // The function takes an input 'x' and returns a value based on the condition that 'x' satisfies.
    function foo(uint256 x) public pure returns (uint256) {
        if (x < 10) {
            return 0;  // Return 0 if x is less than 10
        } else if (x < 20) {
            return 1;  // Return 1 if x is greater than or equal to 10 but less than 20
        } else {
            return 2; // Return 2 if x is greater than or equal to 20
        }
    }

    // Below is ternary operator in Solidity, which is a shorthand way to write if/else statements.
    function ternary(uint256 _x) public pure returns (uint256) {
        return _x < 10 ? 1 : 2;
    }

    // use of multiple conditions in an if/else statement using logical operators.
    function multipleConditions(uint256 a, uint256 b) public pure returns (uint256) {
        if (a > b && a < 20) {
            return 1;
        } else if (a <= b || a >= 20) {
            return 2;
        }
    }
}
