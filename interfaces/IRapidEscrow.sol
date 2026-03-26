// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IRapidEscrow
/// @notice Interface for RapidEscrow.
interface IRapidEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
