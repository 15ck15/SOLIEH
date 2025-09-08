// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IBetaEscrow
/// @notice Interface for BetaEscrow.
interface IBetaEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
