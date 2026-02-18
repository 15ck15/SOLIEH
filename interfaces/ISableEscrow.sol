// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ISableEscrow
/// @notice Interface for SableEscrow.
interface ISableEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
