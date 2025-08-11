// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IQuantumSplitter
/// @notice Interface for QuantumSplitter.
interface IQuantumSplitter {
    function distribute() external;
    function shareA() external view returns (uint256);
}
