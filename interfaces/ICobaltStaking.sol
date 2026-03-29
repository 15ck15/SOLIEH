// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ICobaltStaking
/// @notice Interface for CobaltStaking.
interface ICobaltStaking {
    function stake() external payable;
    function unstake(uint256 amount) external;
    function pendingReward(address account) external view returns (uint256);
}
