// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title NeonVoting
/// @notice Simple proposal voting.
/// @custom:kind voting
contract NeonVoting {
    struct Proposal {
        string description;
        uint256 yes;
        uint256 no;
        uint256 deadline;
    }

    Proposal[] public proposals;
    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event ProposalCreated(uint256 indexed id, string description, uint256 deadline);
    event Voted(uint256 indexed id, address indexed voter, bool support);

    function propose(string calldata description, uint256 duration) external returns (uint256 id) {
        id = proposals.length;
        uint256 deadline = block.timestamp + duration;
        proposals.push(Proposal(description, 0, 0, deadline));
        emit ProposalCreated(id, description, deadline);
    }

    function vote(uint256 id, bool support) external {
        Proposal storage p = proposals[id];
        require(block.timestamp < p.deadline, "voting closed");
        require(!hasVoted[id][msg.sender], "already voted");
        hasVoted[id][msg.sender] = true;
        if (support) {
            p.yes += 1;
        } else {
            p.no += 1;
        }
        emit Voted(id, msg.sender, support);
    }

    function proposalCount() external view returns (uint256) {
        return proposals.length;
    }
}
