// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ICosmicVoting
/// @notice Interface for CosmicVoting.
interface ICosmicVoting {
    function propose(string calldata description, uint256 duration) external returns (uint256 id);
    function vote(uint256 id, bool support) external;
    function proposalCount() external view returns (uint256);
}
