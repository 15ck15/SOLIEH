// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IEmberEscrow
/// @notice Interface for EmberEscrow.
interface IEmberEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
