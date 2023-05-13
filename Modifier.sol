
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


//Function Modifier
// -- Modifier are code that can be run before and after the function call
// --- Generally use for 3 reasons
// ---Restrict access ( Important Point )
// --- Restrict areas Validate Inputs, Guard against hack 
 

 contract FunctionModifier{

     address public owner;
     uint256 public x = 19 ;
     bool public locked;

     constructor(){
         owner = msg.sender;
     }

     modifier onlyOwner(){
         require(msg.sender == owner,"Not Owner");
         _;
     }

     modifier  validateData(address _addr){
         require(_addr != address(0),"Not valid address");
         _;
     }

     modifier  noReentrancy(){
        require(!locked,"No reentrancy.");
        locked = true;
         _;
        locked = false;
     }


    // The change owner function will only called if the two modifier conditions are satisfied -> 
     function changeOwner(address _newOwner) public  onlyOwner validateData (_newOwner){
         owner = _newOwner;
     }


    function decrement(uint256 i) public  noReentrancy{
        x -= 1;
        if(i>1){
            decrement(i-1);
        }
    }


 }
