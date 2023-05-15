// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// the payable
// keyword in solid smart contract so when
// you declare payable keyword in any
// function you can easily able to receive
// ether in the contracts follow the


contract Payable {
    // Payable address can recieve Ether
    address payable public owner;

    // Payable constructors can recieve Ether
    constructor() payable{
        owner = payable(msg.sender); 
    }

    // Function to deposite Either into this contract.
    // Call this function along wiht some Either
    // The balance of this contract will be automatically update.
    function deposite() public payable{}

    // Call this function along with some Ether
    // The function will throw an error since this funciton is not payable
    function notPayble() public {}

    // Function to withdraw all Ether from this contract.
    function withdraw() public{
        // get the amount of Ether stored in this  contract
        uint amount = address(this).balance;

        // send all Ether to owner
        // Owner can recieve Ether since the address of owner is payable
        (bool success,) = owner.call{value: amount}("");
        require(success,"Failed to send Ether. ");

    }

    // Function to transfer Ether from this contract to address from input
    function transfer (address payable _to, uint _amount)public {
        // Note that "to" is declared as payable
        (bool success,) = _to.call{value: _amount}("");
        require(success,"Failed to send the Ether.");
    }









}


















