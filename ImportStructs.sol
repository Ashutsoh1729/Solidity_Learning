// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

struct Todo{
    string text;
    bool completed;
}

// import './ImportEnum.sol';
// Suppose there are Todo struct in the imported file 

// How we use it in our contract
contract Todos{
    // An array of 'Todo' structs
    Todo[] public todos;

}

