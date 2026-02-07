// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title INexusEscrow
/// @notice Interface for NexusEscrow.
interface INexusEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
