// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IStellarFaucet
/// @notice Interface for StellarFaucet.
interface IStellarFaucet {
    function drip() external;
    function lastDrip(address account) external view returns (uint256);
    function setDripAmount(uint256 amount) external;
}
