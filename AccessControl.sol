// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract week3{
   mapping(address=>bytes32)public random;
   address owner;
   constructor(){
       owner=msg.sender;
   }
   bytes32 public Addition=keccak256(abi.encodePacked("Addition"));
   bytes32 public Subtraction=keccak256(abi.encodePacked("Subtraction"));
   bytes32 public Multiplication=keccak256(abi.encodePacked("Multiplication"));
   bytes32 public Division=keccak256(abi.encodePacked("Division"));
   function add(uint _a,uint _b,uint _c) public view returns(uint){
        require(random[msg.sender]==Addition,"Not Accessible");
        return (_a+_b+_c);
    }
    function sub(uint _a,uint _b) public view returns(uint){
        require(random[msg.sender]==Subtraction,"Not Accessible");
        return (_a-_b);
    }
    function mul(uint _a,uint _b,uint _c) public view returns(uint){
        require(random[msg.sender]==Multiplication,"Not Accessible");
        return (_a*_b*_c);
    }
    function div(uint _a,uint _b) public view returns(uint){
        require(random[msg.sender]==Division,"Not Accessible");
        return (_a/_b);
    }
    function setRoles(address _addr,bytes32 _roles )public {
        require(owner==msg.sender,"Not Accessible");
        random[_addr]=_roles;
        random[owner]=_roles;
    }
}
