// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// In solidity we have 2 types of array - 1. Fixed size array, 2. Dynamic sized array


contract Array{
    // Several ways to initialize an array
    uint[] public  arr;
    uint[] public  arr2 = [1,2,3];

    // Fixed sized array, all elements initialize to 0
    uint[10] public myFixedArray;

    function get(uint256 i) public view returns (uint256){
        return  arr[i];
    }

    // Solidity can return the entire array.
    // But this function should be avoided for
    // arrays that can grow indefinitely in length;

    function getArr() public view returns ( uint256[] memory){
        return arr;
    }

    function push(uint256 _i) public {
        // Append to array
        // This will increase the array length by 1.
        arr.push(_i);
    }
    function pop() public {
        // Remove the Last element from array 
        // This will decrease the array length by 1.
        arr.pop();
    }

    function getLength() public view returns (uint256){
        return arr.length;
    }

    function remove(uint256 index) public  {
        // Delete does not change the array length 
        // It resets the value at index to it's default value,
        // in this case 0
        delete  arr[index];
    }

    // Here some problem occure
    // function example(uint256 index) external   {
    //     // create array in memory, only fixed size can be created
    // uint256[] memory a = new uint256[](5);
    // }


}


















