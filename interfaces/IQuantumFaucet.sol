// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IQuantumFaucet
/// @notice Interface for QuantumFaucet.
interface IQuantumFaucet {
    function drip() external;
    function lastDrip(address account) external view returns (uint256);
    function setDripAmount(uint256 amount) external;
}
