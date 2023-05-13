// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


// Structure of mapping
// mapping(keyType => valueType).
// Here keyType can be of any type like , byte, string, other contract
// The valueType can be only mapping or array


contract Mapping{
    // Mapping from address to uint
    mapping (address => uint256) public myMap;

    // TRANSCRIPT
    // Here the so this my mapping will contain all the
    // addresses all the data
    // it's just like a big Basket in that we
    // have all the users all the addresses
    // with this ID we can identify that which
    // user we want to take from that basket
    // so that's how the mapping work so that's
    // the mapping

    function get(address _add) public  view  returns (uint){
        // Mapping always returns a value
        // If the value was never set, it will return the default value.
        return myMap[_add];
    }


    function set(address _addr,uint256 _i) public {
        // Update the value at this address
        myMap[_addr] = _i;
    }

    function remove(address _addr) public  {
        // Reset the value to the default value
        delete myMap[_addr];
    }
}


contract NestedMapping {
    // Nested mapping (mapping from address to another mapping )
    mapping (address=> mapping (uint256 => bool)) public nested;

    function get(address _addr1, uint _i) public view  returns (bool){
        // You can get values from a nested mapping 
        // even when it is not initialized
        return nested[_addr1][_i];
    }

    function set (
        address _addr1,
        uint _i,
        bool _boo
    ) public {
        nested [_addr1][_i ] = _boo;
    }

    function remove(address _addr1,uint _i ) public {
        delete  nested[_addr1][_i];
    }
}


























