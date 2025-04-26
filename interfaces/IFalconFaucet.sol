// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IFalconFaucet
/// @notice Interface for FalconFaucet.
interface IFalconFaucet {
    function drip() external;
    function lastDrip(address account) external view returns (uint256);
    function setDripAmount(uint256 amount) external;
}
