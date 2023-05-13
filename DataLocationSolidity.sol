// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// In solidity we have 3 types of data location
// 1. storage, 2. memory 3. calldata 
// storage - exists on the blockchain
// memory - exists in the function => You want to take the data into the function without storing it on the blockchain
// calldata - used as the argument


contract Datalocations{
    uint[] public arr;
    mapping (uint => address) map;
    struct MyStruct {
        uint foo;
    }

    mapping(uint => MyStruct) myStructs;

    function f() public{
        // call _f with state variables
        _f(arr, map, myStructs[1]);

        // get a struct from mapping
        MyStruct storage myStruct = myStructs[1];
        // create a struct in the memeory
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(
        uint[] storage _arr,
        mapping (uint => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        // do something with storage variables
    }

    // You can return memory variables
    function g(uint[] memory _arr ) public returns(uint[] memory){
        // do something with calldata array

    }




}






















