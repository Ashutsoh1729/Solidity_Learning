// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// Interface
// You can interact with other contracts by declaring an Interface.

// Interface
// - cannot have any function implemented
// - can inhrit from other interfaces
// - all declared functions must be external
// - cannot declare a constructor
// - cannot declare state variables

contract Counter{
    uint public count;
    
    function increment() external{
        count+1;
    }

}


interface Icounter {
    function count() external view returns (uint);

    function increment() external;
}

contract MyContract{
    function incrementCounter(address _counter) external {
        Icounter(_counter).increment();

    }

    function getCount(address _counter) external view returns(uint){
        return Icounter(_counter).count();
    }
}


// Uniswap examples
interface UinswapV2Factory{
    function getPair(address tokenA,address tokenB)external view returns(address pair);        
}

interface UniswapV2Pair{
    function getReverses() external view returns(uint112 reserve0, uint112 reserve1,uint32 blockTimestampLast);
}

contract UniswapExample{
    address private factory = 0x84b55D7EB4649E088B0BE9Be333E2F31a7c671C6;
    address private dai = 0x84b55D7EB4649E088B0BE9Be333E2F31a7c671C6;
    address private weth = 0x84b55D7EB4649E088B0BE9Be333E2F31a7c671C6; 
    
    function getTockenReserves() external view returns(uint,uint){
        address pair = UinswapV2Factory(factory).getPair(dai,weth);
        (uint reserve0,uint reserve1,) = UniswapV2Pair(pair).getReverses();
        return (reserve0,reserve1);
    }




}











