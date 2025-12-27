// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title GoldenVoting
/// @notice Simple proposal voting.
/// @custom:kind voting
contract GoldenVoting {
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

    /// @notice Returns the current block number and timestamp.
    function blockInfo() external view returns (uint256 blockNumber, uint256 blockTimestamp) {
        return (block.number, block.timestamp);
    }

    /// @notice Computes a basis point share of an amount.
    function percentOf(uint256 amount, uint256 bps) external pure returns (uint256) {
        return (amount * bps) / 10_000;
    }

    /// @notice Checks whether an address holds contract code.
    function isContractAddress(address account) external view returns (bool) {
        return account.code.length > 0;
    }

    /// @notice Returns a chain and contract specific domain separator.
    function domainSeparator() external view returns (bytes32) {
        return keccak256(abi.encode(block.chainid, address(this)));
    }

    /// @notice Returns the gas remaining for this call.
    function gasLeftNow() external view returns (uint256) {
        return gasleft();
    }

    /// @notice Returns the current chain id.
    function chainId() external view returns (uint256) {
        return block.chainid;
    }
}
