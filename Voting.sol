// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract voting{
    uint vote_count=0;
    mapping(address=>bool) public votes;
    mapping(address=>uint) public moneygiven;
    mapping(address=>string) public candidates_chosen;
    string [] candidates=["Modi","Congress","AAP"];
    address payable owner;
    constructor(){
        owner=payable(msg.sender);
    }
    function addMoney() public payable{}
    function vote(address voter) public payable{
        require(vote_count==0,"You have already voted");
        require(moneygiven[msg.sender]==1,"You are not allowed to Vote");
        vote_count+=1; 
        votes[voter]=true;
        //candidates_chosen[voter]="Modi";

        //voter has to send it to contract 1 ether
        //voter.transfer(1 ether);
    }
    function giveMoney() public payable{
        require(msg.value==1 ether,"You have to send 1 ether to vote");
        moneygiven[msg.sender]+=1;
    }
    function withdrawbalance() public payable 
    {
        require(owner == msg.sender, "Your are Not Authorized");
        owner.transfer(address(this).balance);
    }
}
