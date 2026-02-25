// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ISolarEscrow
/// @notice Interface for SolarEscrow.
interface ISolarEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
