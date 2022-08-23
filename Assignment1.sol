// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";
contract Task_1{
    function helloWorld() public pure returns(string memory){
        return "Hello World!I am Priyambi Hiran";
    }
}

contract Task_2{
    //uint public ramu_1=45;
    uint ramu=45;
    function print()public view{
        console.log(ramu);
    }
}

contract Task_3{
    // uint a=45;
    // uint b=20;
    // uint c=43;

    function add(uint _a,uint _b,uint _c) public pure returns(uint){
        return (_a+_b+_c);
    }
}
contract Task_4{
    uint public num=80;
    string public name="Priyambi";
    function setterTask()public{
        console.log("Before",num);
        num=90;
        console.log("After",num);
    } 
    function setterTask(uint x)public{
        console.log("Before",num);
        num=x;
        console.log("After",num);
    }
    function setterTask(string memory y) public{
        console.log("Before",name);
        name=y;
        console.log("After",name);
    }
}

contract Task_5{
    event trial(uint value);
    function sendValue() public payable{
        uint data=address(this).balance;
        emit trial(data);
    }
}

contract Assignment{
    uint[] data;
    uint i=0;
    event display(uint[] value);
    function while_loop() public {
    while(i< 5) {
        i++;
        data.push(i);
     }
      emit display(data);
    }
    function for_loop() public returns(uint[] memory){
    for(uint j=0; j<5; j++){
        data.push(j);
     }
      return data;
    }

}
