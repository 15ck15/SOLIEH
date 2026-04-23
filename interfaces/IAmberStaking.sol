// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IAmberStaking
/// @notice Interface for AmberStaking.
interface IAmberStaking {
    function stake() external payable;
    function unstake(uint256 amount) external;
    function pendingReward(address account) external view returns (uint256);
}
