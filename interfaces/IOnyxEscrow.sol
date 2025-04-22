// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IOnyxEscrow
/// @notice Interface for OnyxEscrow.
interface IOnyxEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
