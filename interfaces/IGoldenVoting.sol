// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IGoldenVoting
/// @notice Interface for GoldenVoting.
interface IGoldenVoting {
    function propose(string calldata description, uint256 duration) external returns (uint256 id);
    function vote(uint256 id, bool support) external;
    function proposalCount() external view returns (uint256);
}
