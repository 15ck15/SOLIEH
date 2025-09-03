// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title IRoyalEscrow
/// @notice Interface for RoyalEscrow.
interface IRoyalEscrow {
    function release() external;
    function refund() external;
    function settled() external view returns (bool);
}
