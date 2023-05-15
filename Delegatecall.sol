// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;



// Note: Deploy this contract first
contract B{
    // Note: storage Layout must be the same as contract A
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A{
     uint public num;
     address public sender;
     uint public value;

     function setVars(address _contract,uint _num) public payable{
        // A's storage is set, B is not modified.
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)",_num)
        );
     }
}
























