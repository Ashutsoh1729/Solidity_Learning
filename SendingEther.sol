// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

// - transfer(2300gas,throw error)
// - send(2300gas,returns bool)
// - call(forward all gas or set gas,returns bool)


contract ReciveEther {
    /*
    
    Which function is called, fallback() or receieve()?
     
            send Ether
                |
         msg.data is empty?
             /     \ 
            yes    no
            /        \ 
 recieve() exists?   fallback()
      /   \
    yes    no 
    /        \
 recieve()   fallback()
    
     */

    // Function to recieve Eiteher. msg.data be empyh
    receive () external payable{}

    // Fallback function is called when msg.data is not empty
    fallback() external payable{}

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

}



contract SendEther {
    function sendViaTransfer(address payable _to) public payable{
        // This function is no longer recomended for sending Ether.
        _to.transfer(msg.value);

    }

    function sendViaSend(address payable _to) public payable{

        // Send returns a boolean value indicating success or failure
        // This function is not recomended for sending Ether.
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");

    }

    function sendViaCall(address payable _to) public payable {
        // Call returns a boolean value indication success or failure
        // This is the current recomeded method to use
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent,"Failed to send the Ether.");
    }
}
























