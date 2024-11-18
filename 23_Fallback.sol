// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Example 1: Receiving Ether
contract EtherReceiver {
    uint public totalReceived;

    // This fallback function is used to keep track of the total Ether received by the contract.
    // It's triggered when Ether is sent to the contract's address in a transaction without data.
    fallback() external payable {
        totalReceived += msg.value;
    }
}

// Example 2: Proxy Pattern
contract Proxy {
    address public implementation;

    constructor(address _implementation) {
        implementation = _implementation;
    }

    // This fallback function is used to implement the proxy pattern.
    // Assuming implementation variable has `delegatecall` function.
    // It catches any calls that don't match any of the proxy's functions and forwards them to the implementation contract.
    // It's triggered when a function that doesn't exist in the proxy contract is called.
    fallback() external payable {
        (bool success, ) = implementation.delegatecall(msg.data);
        require(success);
    }
}

// Example 3: Default Functionality
contract DefaultFunctionality {
    // Event to emit when the fallback function is triggered
    event FallbackTriggered(string message);

    // This fallback function provides default functionality when no function is specified or the specified function doesn't exist.
    // It's triggered when the contract is called without specifying any function, or if the function specified doesn't exist in the contract.
    fallback() external {
        // Emit an event when the fallback function is triggered
        emit FallbackTriggered("Fallback function was called.");
    }
}

// Example 4: Fallback with bytes type input and output
contract FallbackWithInputOutput {
    // Event to emit when the fallback function is triggered
    event FallbackTriggered(string message, bytes input, bytes output);

    // This fallback function takes an input, performs some operation, and returns an output.
    // It's triggered when the contract is called without specifying any function, or if the function specified doesn't exist in the contract.
    fallback(bytes calldata input) external payable returns (bytes memory) {
        // Perform some operation with the input
        bytes memory output = new bytes(input.length);
        for (uint i = 0; i < input.length; i++) {
            output[i] = input[i];
        }

        // Emit an event when the fallback function is triggered
        emit FallbackTriggered("Fallback function was called.", input, output);

        return output;
    }
}
