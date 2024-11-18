// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract BaseContract {
    // External function
    // Can be called from other contracts and via transactions
    // Cannot be called internally
    function externalFunc() external pure returns (string memory) {
        return "External function called";
    }

    // Public function
    // Can be called internally or via message calls
    function publicFunc() public pure returns (string memory) {
        return "Public function called";
    }

    // Internal function
    // Can only be accessed from within the current contract or contracts deriving from it
    // Cannot be accessed externally
    function internalFunc() internal pure returns (string memory) {
        return "Internal function called";
    }

    // Private function
    // Can only be accessed from within the current contract
    // Cannot be accessed from derived contracts or externally
    function privateFunc() private pure returns (string memory) {
        return "Private function called";
    }

    function testFuncs() public view returns (string memory, string memory) {
        // Call the public and internal functions
        // Call the external function using "this"
        return (publicFunc(), this.externalFunc());
    }
}

contract DerivedContract is BaseContract {
    function callBaseFuncs() public view returns (string memory, string memory) {
        // Can call the public and internal functions of the base contract
        return (publicFunc(), internalFunc());
    }
}
