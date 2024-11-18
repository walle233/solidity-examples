// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract MyContract {
    address public owner;
    uint256 public balance;
    bool private _currentlyExecuting;

    constructor() {
        owner = msg.sender;
        _currentlyExecuting = false;
        balance = 0;
    }

    // Modifier to check if the caller is the owner of the contract
    modifier onlyOwner {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    // Modifier to check if multiple parameters are valid
    modifier validParams(address _addr, uint256 _amount) {
        require(_addr != address(0), "Invalid address");
        require(_amount > 0, "Amount must be greater than zero");
        _;
    }

    // Modifier to prevent reentrancy attacks
    modifier nonReentrant {
        // Check if the function is currently being executed
        require(!_currentlyExecuting, "Reentrant call");

        // Set the flag to true to signal that the function is being executed
        _currentlyExecuting = true;

        // Execute the rest of the function
        _;

        // Reset the flag to false after the function has finished executing
        _currentlyExecuting = false;
    }

    // Function to deposit funds into the contract
    function depositFunds(uint256 _amount) public onlyOwner {
        balance += _amount;
    }

    // Function that can only be called by the owner and is protected against reentrancy attacks
    function sensitiveFunction(address _to, uint256 _amount) public onlyOwner nonReentrant validParams(_to, _amount) {
        // Transfer the specified amount to the specified address
        balance -= _amount;
        // This is just an example, in a real contract you would use the transfer function of the address
    }
}
