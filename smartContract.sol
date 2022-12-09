// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import "@openzeppelin/contracts/utils/Strings.sol"; //for typecasting

contract Post {

    string public postContent;
    mapping (address => uint256) private voters;
    uint256 private voteRemove;
    uint256 private totalVotes;

    constructor(string memory content) {
        postContent = content;
        voteRemove = 0;
        totalVotes = 0;
    }

    function voteToRemove() public {
        //this is where votes will be added
        // TODO: add check to see if user already voted
        if ()
        voteRemove += 1;
        totalVotes += 1;
        voters[msg.sender] = 1;
        //voters.push(msg.sender);
        // TODO: check to see if content should be removed
    }

    function voteToKeep() public {
        totalVotes += 1;
        voters[msg.sender] =0;
    }

    function getVotes() public view returns(string memory votesToRemove) {
        string memory rmvVotes;
        rmvVotes = Strings.toString(voteRemove);

        // return abi.encodePacked("Votes to remove: ", Strings.toString(voteRemove), "Total votes: ", Strings.toString(totalVotes));
        votesToRemove = rmvVotes;
    
    }

}
