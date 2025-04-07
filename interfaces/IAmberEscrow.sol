// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IAmberEscrow
/// @notice Interface for AmberEscrow.
interface IAmberEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
