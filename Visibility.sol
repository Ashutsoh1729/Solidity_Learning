// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// Visibility
// Functions and state variables have to declare whether they are accessible by other contracts.
// Functions can be declared as
// • public - any contract and account can call
// • private - only inside the contract that defines the function
// • internal- only inside contract that inherits an internal function
// • external - only other contracts and accounts can call

contract Base {
    // private function can only be called
    // -inside this contract
    // Contracts that inherit this contract cannot call this function

    function privateFunc() private pure returns (string memory) {
        return "Private funciton called.";
    }

    function testPrivateFunction() public pure returns (string memory) {
        return privateFunc();
    }

    // Internal function can be called
    // - inside this contract
    // - inside contracts that inherits this contract

    function internalFunc() internal pure returns (string memory) {
        return "Internal function called";
    }

    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }

    // Public functions can be called
    // - inside this contract
    // - inside contracts that inherits this contract
    // - by other contracts and accounts

    function publicFunc() public pure returns (string memory) {
        return "publicFunc is called.";
    }

    // External functions can only called
    // - by other contracts and accounts

    function externalFunc() external pure returns (string memory) {
        return "externalFunction Called.";
    }

    // Thsi function will not compile since we're trying to call
    // an external function here.
    // function textExternalFunc() public pure returns(string memory){
    // return externalFunc();
    // }

    // State Variables
    string private privateVar = "my private variable";
    string internal internalVar = "my internal variable";
    string public publicVar = "my public variable.";
    // State variables cannot be external so this code won't compile
    // string external externalVar = "my public variable.";
}

contract Child is Base {
    // Inherited contracts do not have access to private functions
    // and state variables.
    // function testPrivateFunc() public pure returns(string memory){
    // return privateFunc();
    // }

    // Internal function can be called inside child contracts.
    function testInternalFunc() public pure override returns (string memory) {
        return internalFunc();
    }
}
