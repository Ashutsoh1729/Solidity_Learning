// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract HashFunction{
    function hash(
        string memory _text,
        uint _num,
        address _addr
    ) public pure returns(bytes32){
        return keccak256(abi.encodePacked(_text,_num,_addr));
    }

    // Examples of hash collisions
    // Hash collisions can occur when you pass more than one dynamic data type
    // to abi.encodePacked. In such a case, you should use the abi.encode instead.

    function collision( string memory _text,string memory _anotherText) public pure returns(bytes32){
        // encodePacked(AAA, BBB) -> AAABBB
        // encodePacked(AA, BBB) -> AAABBB
        return keccak256(abi.encodePacked(_text,_anotherText));
    }

}



contract GuessTheMagicWord{
    // bytes32 public answer = 0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef;

    // Here there is something worng in the following code, The decoded code is not the same as the given value
    bytes32 public answer = 0x6adfb183f2c6af17e9abacee763b1c18224f8b184a3c7a1b4476b009c4dd24f3;
    // bytes32 public answer = bytes32("Solidity");


    // Magic word is "Solidity"
    function guess(string memory _word) public view returns(bool){
        return keccak256(abi.encodePacked(_word)) == answer;
    }
}




















