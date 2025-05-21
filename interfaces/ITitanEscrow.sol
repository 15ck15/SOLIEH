// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ITitanEscrow
/// @notice Interface for TitanEscrow.
interface ITitanEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
