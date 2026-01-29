// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IZenithEscrow
/// @notice Interface for ZenithEscrow.
interface IZenithEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
