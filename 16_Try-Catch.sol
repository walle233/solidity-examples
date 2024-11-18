// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// External contract used for try / catch examples
contract ExternalContract {
    address public owner;

    constructor(address _owner) {
        require(_owner != address(0), "Invalid address");
        assert(_owner != 0x0000000000000000000000000000000000000001);
        owner = _owner;
    }

    function performAction(uint256 x) public pure returns (string memory) {
        require(x != 0, "Require failed");
        return "Action performed";
    }
}

contract MainContract {
    event Log(string message);
    event LogBytes(bytes data);

    ExternalContract public externalContract;

    constructor() {
        // This ExternalContract is used for example of try catch with external call
        externalContract = new ExternalContract(msg.sender);
    }

    // Example of try / catch with external call
    // handleExternalCall(0) => Log("External call failed")
    // handleExternalCall(1) => Log("Action performed")
    function handleExternalCall(uint256 _i) public {
        try externalContract.performAction(_i) returns (string memory result) {
            emit Log(result);
        } catch {
            emit Log("External call failed");
        }
    }

    // Example of try / catch with contract creation
    // handleNewContract(0x0000000000000000000000000000000000000000) => Log("Invalid address")
    // handleNewContract(0x0000000000000000000000000000000000000001) => LogBytes("")
    // handleNewContract(0x0000000000000000000000000000000000000002) => Log("ExternalContract created")
    function handleNewContract(address _owner) public {
        try new ExternalContract(_owner) returns (ExternalContract _externalContract) {
            // you can use variable _externalContract here
            emit Log("ExternalContract created");
        } catch Error(string memory reason) {
            // catch failing revert() and require()
            emit Log(reason);
        } catch (bytes memory reason) {
            // catch failing assert()
            emit LogBytes(reason);
        }
    }
}
