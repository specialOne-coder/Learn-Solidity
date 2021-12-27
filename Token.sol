// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Token  {

    mapping(address => uint) public balance;
    address payable wallet;

    event Purchase(
        address _buyer,
        uint _amount
    );

    constructor(address payable _wallet){
        wallet = _wallet;
    }

    function buyToken() public payable{
        //buy token
        balance[msg.sender] += 1;
        //send ether
        wallet.transfer(msg.value);
        //publish transaction
        emit Purchase(msg.sender,1);
    }


}