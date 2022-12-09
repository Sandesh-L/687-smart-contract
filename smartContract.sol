// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import "@openzeppelin/contracts/utils/Strings.sol"; //for typecasting
import "./voterLibrary.sol";

contract Post {

    using voterLib for voterLib.voters;
    string public postContent;
    mapping (address => voterLib.voters) allVoters;
    uint256 private voteRemove;
    uint256 private totalVotes;

    constructor(string memory content) {
        postContent = content;
        voteRemove = 0;
        totalVotes = 0;
    }

    function voteToRemove() public returns(string memory returnMsg){
        //this is where votes will be added
        // TODO: add check to see if user already voted
        if (allVoters[msg.sender].hasVoted){
            returnMsg = "You have aready voted.";
        }else{
            allVoters[msg.sender].hasVoted=true;
            voteRemove += 1;
            totalVotes += 1;
        }
        // TODO: check to see if content should be removed
    }

    function voteToKeep() public returns(string memory returnMsg){
        if (allVoters[msg.sender].hasVoted){
            returnMsg = "You have already voted.";
        }else{
            allVoters[msg.sender].hasVoted=true;
            totalVotes += 1;
        }
    }

    function getVotes() public view returns(string memory votesToRemove) {
        string memory rmvVotes;
        rmvVotes = Strings.toString(voteRemove);

        // return abi.encodePacked("Votes to remove: ", Strings.toString(voteRemove), "Total votes: ", Strings.toString(totalVotes));
        votesToRemove = rmvVotes;
    
    }

}
