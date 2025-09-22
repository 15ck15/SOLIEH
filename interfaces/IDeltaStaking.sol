// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IDeltaStaking
/// @notice Interface for DeltaStaking.
interface IDeltaStaking {
    function stake() external payable;
    function unstake(uint256 amount) external;
    function pendingReward(address account) external view returns (uint256);
}
