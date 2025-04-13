// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IMetaStaking
/// @notice Interface for MetaStaking.
interface IMetaStaking {
    function stake() external payable;
    function unstake(uint256 amount) external;
    function pendingReward(address account) external view returns (uint256);
}
