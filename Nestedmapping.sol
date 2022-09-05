// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
contract nestedmapping{
address owner;
constructor(){
    owner=msg.sender;
}
mapping(bytes32=>mapping(address=>bytes32)) public random;
bytes32 public Addition=keccak256(abi.encodePacked("Addition"));
bytes32 public Subtraction=keccak256(abi.encodePacked("Subtraction"));

function giveRole(bytes32 _role,address _addr) public {
    require(owner==msg.sender,"Not Accessible");
    random[_role][_addr]=_role;
}
}
