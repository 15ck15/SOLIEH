// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IAtlasStaking
/// @notice Interface for AtlasStaking.
interface IAtlasStaking {
    function stake() external payable;
    function unstake(uint256 amount) external;
    function pendingReward(address account) external view returns (uint256);
}
