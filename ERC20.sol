// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ERC20{
     string name;
     mapping(address => uint) public balance;

     constructor(string memory _name){
         name = _name;
     }

     function mint() public{
         balance[tx.origin]++;
     }
     
}

contract MyContract is ERC20{

    address[] public owners;
    string public symbol;
    uint ownerCount;

    constructor(string memory _name,string memory _symbol) ERC20(_name){
        symbol = _symbol;
    } 

    function mints() public{
        super.mint();
        ownerCount++;
        owners.push(msg.sender);
    }


}