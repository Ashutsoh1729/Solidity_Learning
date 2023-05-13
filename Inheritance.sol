// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;


// Solidity supports multipile inheritance. Contracts can inherit other contracts using `is` keyword.
// Function that is going to be overwridden by a child contract must be declared as `virtual`.
// Function that is going to override a parent function must use the keyword override.

/* Graph of Inheritance 

        A
       /  \
      B    C
     /  \ /
    D   E,F

 */


contract A {
    function foo() public pure virtual returns(string memory){
        return "A";
    }
}

// Contract is inherit other contracts by using the keyword `is`
contract B is A {
    // Override A.foo()
    function foo() public pure virtual override returns(string memory){
        return "B";
    }

}
contract C is A{
    // Override A.foo()
    function foo() public pure virtual override returns(string memory){
        return "C";
    }
}

// Contracts can inherit from multiple parent contracts.
// When a function is called that is defined multiple times in
// different contracts, parent contracts are searched from
// right to left, and in depth-first manner.




contract D is B, C {
    // D.foo() returns "C"
    // since C is the right most parent contract with function foo()
    function foo() public pure override (B, C) returns (string memory) {
        return super.foo();
    }
}
contract E is C,B {
    // D.foo() returns "C"
    // since C is the right most parent contract with function foo()
        function foo() public pure override (B, C) returns (string memory) {
            return super.foo();
    }
}



// Inheritance must be ordered from "most base-like" to "most derived".
// Swapping the order of A and B will throw a compilation error.


contract F is A,B {
    function foo() public pure override (A, B) returns (string memory) {
        return super.foo();
    }


}





















