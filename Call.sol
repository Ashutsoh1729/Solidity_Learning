// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;


contract  Receiver {
    constructor() {
        
    }

    event  Received(address caller,uint amount, string message);

    fallback() external payable{
        emit Received(msg.sender,msg.value,"Fallback was called.");
    }

    function  foo(string memory _message,uint _x) public payable  returns (uint) {
        emit Received(msg.sender,msg.value,_message);
        return _x +1;

    }
}

contract Caller{
    event Response(bool success, bytes data);
    // Let's imagine that contract Caller does not have the source code for the 
    // contact Receiver, but we do know the address of contract Reciever and the to call

    function testCallFo(address payable _addr) public payable{
        // You can send ether and specify a custom gas amount
     // I don't understand the below line of code
      (bool success, bytes memory data) = _addr.call{value: msg.value,gas:5000}(abi.encodeWithSignature("foo(string,uint)","call foo",123) ) ;
        emit Response(success,data);
    }

    // Calling a function that does not exist triggers the fallback function
    function testCallDoesNotExist(address _addr) public {
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("doesNotExist()")            
        );
        emit Response(success,data);
    }
}



















