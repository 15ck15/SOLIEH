// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ISilverFaucet
/// @notice Interface for SilverFaucet.
interface ISilverFaucet {
    function drip() external;
    function lastDrip(address account) external view returns (uint256);
    function setDripAmount(uint256 amount) external;
}
