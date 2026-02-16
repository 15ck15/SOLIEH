// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IZenithEscrow2
/// @notice Interface for ZenithEscrow2.
interface IZenithEscrow2 {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
