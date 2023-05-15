// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// External contract used for try / catch examples


contract Foo{
    address public owner;

    constructor (address _owner){
        require(_owner!= address(0),"Invalid address");
        assert(_owner!= 0x0000000000000000000000000000000000000000);
        owner = _owner;

    }    

    function myFunc(uint x) public pure returns(string memory){
        require(x!=0,"require failed.");
        return "My function was called.";
    }
}

contract Bar {
    event  Log(string message);
    event LogBytes(bytes data);

    Foo public foo;

    constructor (){
        // This Foo contract is used for example of try cathch with external call
        foo = new Foo(msg.sender);
    }
    // Example fo try / catch with external call 
    // tryCathcExternalCall(0) => Log("external call failed")
    // tryCathcExternalCall(1) => Log("My func was called")

    function tryCatchExternalCall(uint _i) public {
      try foo.myFunc(_i) returns (string memory result) {
        emit Log(result);
      } catch  {
        emit Log("external call failed");
      }        
    }







        // Example fo try / catch with external call 

        // 1st we have to check that contract donot have these 0 addresses, if it has then we have to show the error messages
        // tryCatchNewContract(0x0000000000000000000000000000000000000000) => Log("invalid")
        // tryCatchNewContract(0x0000000000000000000000000000000000000001) => Log("invalid")
        // tryCatchNewContract(0x0000000000000000000000000000000000000002) => Log("invalid")

        // Error shows that free functions cannot have visibility, so i have to remove the public keyword
        function tryCatchNewContract(address _owner) public{
            try new Foo(_owner) returns(Foo foo){
                // You can use variable foo here
                emit Log("Foo created");
            }catch Error(string memory reason){
                // catch failing revert() and require()
                 emit Log(reason);
            }catch(bytes memory reason){
                // catch failing assert()
                emit LogBytes(reason);
            }
        }



}

    













