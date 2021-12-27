// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

 contract MyContract {
     mapping(uint=>Person) people;
     uint public peopleCount;
     address owner;

     modifier onlyOwner()  {
         require(msg.sender == owner);
         _;
     }

     struct Person{
         uint id;
         string firstName;
         string lastName;
     }

     constructor(){
         owner = msg.sender ;
     }

     function addPerson(string memory firstName,string memory lastName) public onlyOwne{
         incrementCount();
         people[peopleCount] = Person(peopleCount,firstName,lastName);
         
     }

     function incrementCount() internal{
         peopleCount += 1;
     }

     function removePerson(uint id) public {
         peopleCount -= 1;
         people[id] = Person(0,'','');
     }

 }