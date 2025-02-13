// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Free function defined outside of a contract
// Always has implicit internal visibility
function freeFunction(uint a, uint b) pure returns (uint) {
    return a + b;
}

contract Simple {
    uint sum;

    // Function defined inside a contract
    // Takes two uint parameters as input
    function taker(uint a, uint b) public {
        sum = a + b;
    }

    // Function that returns multiple values
    // The names of return variables can be omitted
    function arithmetic(uint a, uint b)
        public
        pure
        returns (uint, uint)
    {
        return (a + b, a * b);
    }

    // Function that uses an early return
    // Must provide return values together with the return statement
    function earlyReturn(uint a, uint b)
        public
        pure
        returns (uint sum, uint product)
    {
        if (a == 0 || b == 0) {
            return (0, 0);
        }

        sum = a + b;
        product = a * b;
    }
}
