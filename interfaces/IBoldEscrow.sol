// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IBoldEscrow
/// @notice Interface for BoldEscrow.
interface IBoldEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
