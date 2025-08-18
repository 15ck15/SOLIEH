// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IQuantumEscrow
/// @notice Interface for QuantumEscrow.
interface IQuantumEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
