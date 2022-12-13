// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

import "@openzeppelin/contracts/utils/Strings.sol"; //for typecasting
import "./voterLibrary.sol";

contract Post {

    using voterLib for voterLib.voters;
    string public postHash;
    string public postLink;
    mapping (address => voterLib.voters) allVoters;
    uint private voteRemove;
    uint private totalVotes;

    constructor(string memory hash, string memory link) {
        postLink = link;
        postHash = hash;
        voteRemove = 0;
        totalVotes = 0;
    }

    function percent(uint numerator, uint denominator) private pure returns(uint quotient) {

        // caution, check safe-to-multiply here
        uint _numerator  = numerator * 10 ** (3);
        // with rounding of last digit
        uint _quotient =  ((_numerator / denominator) + 5) / 10;
        return ( _quotient);
    }

    function voteToRemove() public returns(string memory returnMsg){
        //this is where votes will be added
        if (allVoters[msg.sender].hasVoted){
            returnMsg = "You have aready voted.";
        }else{
            allVoters[msg.sender].hasVoted=true;
            voteRemove += 1;
            totalVotes += 1;
            returnMsg="Vote successfully saved";
        }
        if (totalVotes > 5 && percent(voteRemove,totalVotes) > 50){
            postLink=" ";
            returnMsg= "Voting completed, link removed";
        }
 
    }

    function voteToKeep() public returns(string memory returnMsg){
        if (allVoters[msg.sender].hasVoted){
            returnMsg = "You have already voted.";
        }else{
            allVoters[msg.sender].hasVoted=true;
            totalVotes += 1;
            returnMsg="Vote successfully saved";
        }
    }

    function getVotes() public view returns(string memory votesToRemove) {
        string memory rmvVotes;
        rmvVotes = Strings.toString(voteRemove);

        votesToRemove = rmvVotes;
    
    }

}
