// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IPhoenixEscrow
/// @notice Interface for PhoenixEscrow.
interface IPhoenixEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
