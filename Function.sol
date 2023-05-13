// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract Function{
    // Function can return multiple value
    function returnMany () public pure returns(uint,bool,uint){
        return (1,false,12);
    }

    // Return values by name 
    function named() public pure returns( uint x, bool b,uint y){
        return (1,false, 3);
    }

    // Return values can be assigned to their name
    // In this case the return can be omitted

    function assigned() public pure returns(uint x, bool b,uint y ){
        x = 1;
        b=false;
        y = 13;
        
    }

    // Use destructuring assingment when calling another
    // function that returns multiple values
    function destructuringAssignments()public pure returns(uint, bool,uint,uint,uint){
        (uint i,bool b,uint c) = returnMany();

        // Values can be left out.
        (uint x, uint y) = (4,5);

        return(i,b,c,x,y);
    }


    // Cannot use map for either input or output

    // Can use array for input
    function arrayInput(uint[] memory _arr) public {}

    // Can use array for output

    uint[] public arr;

    function arrayOutput() public view returns(uint[] memory){
        return arr;
    }


}
    // Call function with key-value inputs
    contract XYZ{
        function someFunctionnWithManyInputs(uint x, uint y,uint z, address a,bool b,string memory c) public pure returns(uint){}

        function callFunc()external pure returns(uint){
            return someFunctionnWithManyInputs(1,2,3,address(0),true,'c');
        }

        function callFuncWithKeyValue() external pure returns(uint){
            return  
                    someFunctionnWithManyInputs({ a: address(0),b:true,c:"c",x:1,y:2,z:3});
        }





    }











