// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;


interface IERC20 {
    function transfer(address,uint) external;
}

contract Tocken{
    function transfer(address,uint) external {

    }
}

contract AbiEncoded{
    function test(address _contract, bytes calldata data) external{
        (bool ok,) = _contract.call(data);
        require(ok,"call failed");
    }

    function endcodeWithSignature(address to,uint amount) external pure returns(bytes memory){
        // Typo is not checked - "transfer(address,uint)";
        return abi.encodeWithSignature("transfer(address),uint",to,amount);


    }

    function encodeWitheSelector(address to,uint amount) external pure returns(bytes memory){
        // Type is not checked - (IERC20.transfer.selector,true,amount)
        return abi.encodeWithSelector(IERC20.transfer.selector, to,amount);

    }

    function encodeCall(address to, uint amount) external pure returns(bytes memory){
        // Typo and type error will not compile
        return abi.encodeCall(IERC20.transfer,(to,amount));
    }







}































