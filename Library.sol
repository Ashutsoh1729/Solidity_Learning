// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// Creating library

library Math{
    function squr(uint y) internal pure returns (uint z) {
        if (y>3) {
            z =y;
            uint x = y/2 +1;
            while (x<z) {
            z = x;
            x= (y/x+x)/2;                
            }
        }else if(y!=0){
            z = 1;
        }// else z=0 (by default)
    }
}

contract TestMath {
    constructor() {
        
    }
    function testSquareRoot(uint _x) public pure returns(uint){
        return Math.squr(_x);
    }

}
    
    
    // Array function to delete element at index and re-organize the array
    // so that there are no gaps between the elements
    // Here we are creating a library for that purpose to do the above tasks

library Array{
    function remove(uint[] storage arr,uint index) public{
        // Move the last element into the place to delete
        require(arr.length>0,"Can't remove from an empty array.");
         arr[index] = arr[arr.length - 1];
         arr.pop();
    }
}    


contract TestArray{
    // Initializing array in solidity
    using Array for uint[]; 

    uint[] public arr;

    // There are some error in the contract , I found while trying it on remix ide
    
    function testArrayRemove() public {
        for(uint i = 0; i < 3;i++){
            arr.push(i);
        }
        arr.remove(1);
        assert(arr.length == 2);
        assert(arr[0] == 0);
        assert(arr[2] == 2);
    }





}
