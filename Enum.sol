// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;


contract Enum {
    constructor() {
        
    }
    // Array act like an indexing
    // Enum representing shipping status
    enum Status{
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
    // Default value is hte fast element Listed in
    // definition of type , in this case "Pending"

    Status public status;

    //Returns uint
    //Pending - 0
    //Shipped - 1
    //Accepted - 2
    //Rejected - 3
    //Canceled - 4

    function get() public view returns(Status){
        return status;
    }

    // Update the status by passing uinnt into input
    function set(Status _status) public {
        status = _status;
    }

    // You can update to a spedific enum like this 
    function cancel() public {
        // status = Status.Canceled;
        status = Status.Canceled;
    }

    // delete resets the enum to its first value, 0
    function reset() public {
        delete status;
    }




}