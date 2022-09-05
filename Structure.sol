// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract structure{
    struct User{
        string name;
        string email;
        uint age;
        bool verified;
    }

    User public user1;
    User[] public users;
    mapping(address=>User) public UserMappingUsingAddress;
    function addData() public{
        user1.name="Priyambi";
        user1.email="priyambi.hiran@gmail.com";
        user1.age=20;
        user1.verified=true;
    }
    function changeData(string memory _name,string memory _email, uint _age) public{
        user1.name=_name;
        user1.email=_email;
        user1.age=_age;
        user1.verified=true;
    }
    function createUserList(string memory _name,string memory _email, uint _age,bool _verified) public{
        User memory temp=User(_name,_email,_age,_verified);
        users.push(temp);
    }
    function changeUserListData(uint _index,string memory _name,string memory _email, uint _age) public{
        users[_index].name=_name;
        users[_index].email=_email;
        users[_index].age=_age;
        users[_index].verified=true;
    }
    function createUserMapping(string memory _name,string memory _email, uint _age,bool _verified) public{
        User memory temp=User(_name,_email,_age,_verified);
        UserMappingUsingAddress[msg.sender]=temp;
    }
}
